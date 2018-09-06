#!/usr/bin/env bash

FORSETI_DIR=$(pwd)/forseti-security

git clone https://github.com/GoogleCloudPlatform/forseti-security.git
cd $FORSETI_DIR
git fetch --all
git checkout tags/v$FORSETI_VERSION

touch /var/log/forseti.log
chown root:root /var/log/forseti.log
cp $FORSETI_DIR/configs/logging/logrotate/forseti /etc/logrotate.d/forseti
chmod 644 /etc/logrotate.d/forseti
logrotate /etc/logrotate.conf

chmod -R ug+rwx $FORSETI_DIR/configs $FORSETI_DIR/rules

# Install Forseti
python setup.py install

# Configure Forseti

# Environment Variables Required for Forseti Server Configuration
# {export_initialize_vars}
# CLOUDSQL_CONN_STRING=context.env['project']:$(ref.cloudsql-instance.region):$(ref.cloudsql-instance.name)')
# SQL_PORT=context.properties['db-port']
# SQL_INSTANCE_CONN_STRING=CLOUDSQL_CONN_STRING
# FORSETI_DB_NAME=context.properties['database-name']

# {export_forseti_vars}
# https://github.com/GoogleCloudPlatform/forseti-security/blob/stable/configs/server/forseti_conf_server.yaml.sample
# FORSETI_HOME=$USER_HOME/forseti-security
# FORSETI_SERVER_CONF=$FORSETI_HOME/configs/forseti_conf_server.yaml
# SCANNER_BUCKET=gs://<scanner-bucket>

# Environment Variables Required for Forseti Client Configuration
# https://github.com/GoogleCloudPlatform/forseti-security/blob/stable/configs/client/forseti_conf_client.yaml.sample
# FORSETI_HOME=$USER_HOME/forseti-security
# FORSETI_CLIENT_CONFIG=$FORSETI_HOME/configs/forseti_conf_client.yaml
