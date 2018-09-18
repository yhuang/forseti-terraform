#!/usr/bin/env bash

set -o errexit
set -o nounset

# Store the variables in $FORSETI_SECURITY_ENVIRONMENT_SH, so
# all the users will have access to them.
FORSETI_SECURITY_ENVIRONMENT_SH=/etc/profile.d/forseti-security-environment.sh

cat << EOF > $FORSETI_SECURITY_ENVIRONMENT_SH
export FORSETI_HOME=$HOME/${project_name_base}
export FORSETI_SERVER_CONFIG=$FORSETI_HOME/configs/forseti_conf_server.yaml
EOF

source $FORSETI_SECURITY_ENVIRONMENT_SH

cat << EOF > $FORSETI_SERVER_CONFIG
${forseti_conf_server_yaml}
EOF

if ! [[ -f $FORSETI_SERVER_CONF ]]; then
    echo "Could not find the configuration file: $FORSETI_SERVER_CONF." >&2
    exit 1
fi

CLOUDSQL_PROXY_COMMAND="${cloudsql_proxy}"
CLOUDSQL_PROXY_COMMAND+=" -instances=${cloudsql_connection_name}=tcp:${cloudsql_database_port}"

# By default, Systemd starts the executable stated in ExecStart= as root.
# See github issue #1761 for why this needs to be run as root.
CLOUDSQL_PROXY_SERVICE=/lib/systemd/system/cloudsql-proxy.service

cat << EOF > $CLOUDSQL_PROXY_SERVICE
[Unit]
Description=Cloud SQL Proxy
[Service]
Restart=always
RestartSec=3
ExecStart=$CLOUDSQL_PROXY_COMMAND
[Install]
WantedBy=forseti.service
EOF

SQL_SERVER_LOCAL_ADDRESS="mysql://${cloudsql_database_user_name}@127.0.0.1:${cloudsql_database_port}"

FORSETI_COMMAND="${forseti_server} --endpoint '[::]:50051'"
FORSETI_COMMAND+=" --forseti_db $SQL_SERVER_LOCAL_ADDRESS/${cloudsql_database_name}"
FORSETI_COMMAND+=" --config_file_path $FORSETI_SERVER_CONF"
FORSETI_COMMAND+=" --services ${forseti_security_services}"

FORSETI_SERVICE=/lib/systemd/system/forseti.service

cat << EOF > $FORSETI_SERVICE
[Unit]
Description=Forseti Security API Server
[Service]
User=${user}
Restart=always
RestartSec=3
ExecStart=$FORSETI_COMMAND
[Install]
WantedBy=multi-user.target
Wants=cloudsql-proxy.service
EOF

# Define a foreground runner. This runner will start the Cloud SQL
# Proxy and block on the Forseti API server.
FORSETI_FOREGROUND_SH=/usr/bin/forseti-foreground.sh

cat << EOF > $FORSETI_FOREGROUND_SH
$CLOUDSQL_PROXY_COMMAND &&
$FORSETI_COMMAND
EOF

chmod 755 $FORSETI_FOREGROUND_SH

echo "Forseti services are now registered with systemd. Services can be started"
echo "immediately by running the following:"
echo ""
echo "    systemctl start cloudsql-proxy"
echo "    systemctl start forseti"
echo ""
echo "Additionally, the Forseti server can be run in the foreground by using"
echo "the foreground runner script: $FORSETI_FOREGROUND_SH"
