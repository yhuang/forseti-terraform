#!/usr/bin/env bash

set -o errexit
set -o nounset

FORSETI_INSTALL_DIR=${forseti_install_dir}
FORSETI_BUCKET=${forseti_bucket}
FORSETI_SERVER_CONFIG=$FORSETI_INSTALL_DIR/configs/forseti_conf_server.yaml

# Store the variables in $FORSETI_ENVIRONMENT_SH, so
# all the users will have access to them.
FORSETI_ENVIRONMENT_SH=${forseti_environment_sh}

cat << EOF > $FORSETI_ENVIRONMENT_SH
export FORSETI_INSTALL_DIR=$FORSETI_INSTALL_DIR
export FORSETI_BUCKET=$FORSETI_BUCKET
export FORSETI_SERVER_CONFIG=$FORSETI_SERVER_CONFIG
EOF

cat << EOF > $FORSETI_SERVER_CONFIG
${forseti_conf_server_yaml}
EOF

if ! [[ -f $FORSETI_SERVER_CONFIG ]]; then
    echo "ERROR: Could not find configuration file $FORSETI_SERVER_CONFIG." >&2
    exit 1
fi

# https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash

# /lib/systemd/system/cloudsql-proxy.service => cloudsql-proxy.service
CLOUDSQL_PROXY_SERVICE=$(basename -- "${cloudsql_proxy_service}")
# /lib/systemd/system/forseti.service => forseti.service
FORSETI_SERVICE=$(basename -- "${forseti_service}")

CLOUDSQL_PROXY_COMMAND="${cloudsql_proxy}"
CLOUDSQL_PROXY_COMMAND+=" -instances=${cloudsql_connection_name}=tcp:${cloudsql_database_port}"

# By default, Systemd starts the executable stated in ExecStart= as root.
# See github issue #1761 for why this needs to be run as root.
cat << EOF > ${cloudsql_proxy_service}
[Unit]
Description=Cloud SQL Proxy
[Service]
Restart=always
RestartSec=3
ExecStart=$CLOUDSQL_PROXY_COMMAND
[Install]
WantedBy=$FORSETI_SERVICE
EOF

USER=${user}
SQL_SERVER_LOCAL_ADDRESS="mysql://$USER@127.0.0.1:${cloudsql_database_port}"

FORSETI_COMMAND="${forseti_server} --endpoint '[::]:50051'"
FORSETI_COMMAND+=" --forseti_db $SQL_SERVER_LOCAL_ADDRESS/${cloudsql_database_name}"
FORSETI_COMMAND+=" --config_file_path $FORSETI_SERVER_CONFIG"
FORSETI_COMMAND+=" --services ${forseti_services}"

cat << EOF > ${forseti_service}
[Unit]
Description=Forseti API Server
Wants=$CLOUDSQL_PROXY_SERVICE
[Service]
User=$USER
Restart=always
RestartSec=3
ExecStart=$FORSETI_COMMAND
[Install]
WantedBy=multi-user.target
EOF

# Define a foreground runner. This runner will start the Cloud SQL
# Proxy and block on the Forseti API server.
FORSETI_FOREGROUND_SH=${forseti_foreground_sh}

cat << EOF > $FORSETI_FOREGROUND_SH
$CLOUDSQL_PROXY_COMMAND &&
$FORSETI_COMMAND
EOF

chmod 755 $FORSETI_FOREGROUND_SH

echo "Forseti services are now registered with systemd. Services can be started"
echo "immediately by running the following:"
echo ""
echo "    systemctl start $CLOUDSQL_PROXY_SERVICE"
echo "    systemctl start $FORSETI_SERVICE"
echo ""
echo "Additionally, the Forseti server can be run in the foreground by using"
echo "the foreground runner script: $FORSETI_FOREGROUND_SH"

systemctl start $CLOUDSQL_PROXY_SERVICE
systemctl start $FORSETI_SERVICE

RUN_FORSETI_SUITE_SH=${run_forseti_suite_sh}
LOCK_FILE=/tmp/forseti-cron-runner.lock
WARNING="WARNING: New Forseti cron job will not be started, because the previous one is still running."

cat << 'EOF' > $RUN_FORSETI_SUITE_SH
${run_forseti_suite}
EOF

chmod 755 $RUN_FORSETI_SUITE_SH

# Use flock to prevent rerun of the same cron job when the previous job is still running.
# If the lock file does not exist under the tmp directory, it will create the file and put a lock on top of the file.
# When the previous cron job is not finished and the new one is trying to run, it will attempt to acquire the lock
# to the lock file and fail because the file is already locked by the previous process.
# The -n flag in flock will fail the process right away when the process is not able to acquire the lock so we won't
# queue up the jobs.
#
# If the cron job failed the acquire lock on the process, it will log a warning message to syslog.

(echo "${run_frequency} (${flock} -n $LOCK_FILE $RUN_FORSETI_SUITE_SH || echo \"$WARNING\") 2>&1 | logger") | crontab -u $USER -
echo "Added $RUN_FORSETI_SUITE_SH to crontab under user $USER."

echo "Execution of startup script finished."
