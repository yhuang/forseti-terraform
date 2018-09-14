#!/usr/bin/env bash
# Copyright 2017 The Forseti Security Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset

# Reference all required bash variables prior to running. Due to 'nounset', if
# a caller fails to export the following expected environmental variables, this
# script will fail immediately rather than partially succeeding.
echo "Cloud SQL Instance Connection String: ${cloudsql_connection_name}"
echo "SQL Port: ${cloudsql_database_port}"
echo "Forseti Database Name: ${cloudsql_database_name}"

if ! [[ -f $FORSETI_SERVER_CONF ]]; then
    echo "Could not find the configuration file: ${FORSETI_SERVER_CONF}." >&2
    exit 1
fi

SQL_SERVER_LOCAL_ADDRESS="mysql://${cloudsql_database_user_name}@127.0.0.1:${cloudsql_database_port}"
FORSETI_SERVICES="explain inventory model scanner notifier"

FORSETI_COMMAND="$(which forseti_server) --endpoint '[::]:50051'"
FORSETI_COMMAND+=" --forseti_db ${SQL_SERVER_LOCAL_ADDRESS}/${cloudsql_database_name}"
FORSETI_COMMAND+=" --config_file_path ${FORSETI_SERVER_CONF}"
FORSETI_COMMAND+=" --services ${FORSETI_SERVICES}"

SQL_PROXY_COMMAND="$(which cloud_sql_proxy)"
SQL_PROXY_COMMAND+=" -instances=${cloudsql_connection_name}=tcp:${cloudsql_database_port}"


# Cannot use "read -d" since it returns a nonzero exit status.
API_SERVICE="$(cat << EOF
[Unit]
Description=Forseti API Server
[Service]
User=ubuntu
Restart=always
RestartSec=3
ExecStart=$FORSETI_COMMAND
[Install]
WantedBy=multi-user.target
Wants=cloudsqlproxy.service
EOF
)"
echo "$API_SERVICE" > /lib/systemd/system/forseti.service

# By default, Systemd starts the executable stated in ExecStart= as root.
# See github issue #1761 for why this neds to be run as root.
SQL_PROXY_SERVICE="$(cat << EOF
[Unit]
Description=Cloud SQL Proxy
[Service]
Restart=always
RestartSec=3
ExecStart=$SQL_PROXY_COMMAND
[Install]
WantedBy=forseti.service
EOF
)"
echo "$SQL_PROXY_SERVICE" > /lib/systemd/system/cloudsqlproxy.service


# Define a foreground runner. This runner will start the CloudSQL
# proxy and block on the Forseti API server.
FOREGROUND_RUNNER="$(cat << EOF
$SQL_PROXY_COMMAND &&
$FORSETI_COMMAND
EOF
)"
echo "$FOREGROUND_RUNNER" > /usr/bin/forseti-foreground.sh
chmod 755 /usr/bin/forseti-foreground.sh

echo "Forseti services are now registered with systemd. Services can be started"
echo "immediately by running the following:"
echo ""
echo "    systemctl start cloudsqlproxy"
echo "    systemctl start forseti"
echo ""
echo "Additionally, the Forseti server can be run in the foreground by using"
echo "the foreground runner script: /usr/bin/forseti-foreground.sh"
