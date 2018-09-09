#!/usr/bin/env bash

# Configure Forseti

# Environment Variables Required for Forseti Server Configuration
# {export_initialize_vars}
# CLOUDSQL_CONN_STRING=context.env['project']:$(ref.cloudsql-instance.region):$(ref.cloudsql-instance.name)')
# SQL_PORT=context.properties['db-port']
# SQL_INSTANCE_CONN_STRING=CLOUDSQL_CONN_STRING
# FORSETI_DB_NAME=context.properties['database-name']
# FORSETI_HOME=$USER_HOME/forseti-security
# SCANNER_BUCKET=gs://<forseti-bucket>

# {export_forseti_vars}
# https://github.com/GoogleCloudPlatform/forseti-security/blob/stable/configs/server/forseti_conf_server.yaml.sample
# FORSETI_SERVER_CONF=$FORSETI_HOME/configs/forseti_conf_server.yaml

# Environment Variables Required for Forseti Client Configuration
# https://github.com/GoogleCloudPlatform/forseti-security/blob/stable/configs/client/forseti_conf_client.yaml.sample
# FORSETI_CLIENT_CONFIG=$FORSETI_HOME/configs/forseti_conf_client.yaml
