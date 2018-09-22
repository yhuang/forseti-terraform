#!/usr/bin/env bash

set -o errexit
set -o nounset

USER=${user}
FORSETI_HOME=/home/$USER/${project_name_base}
FORSETI_CLIENT_CONFIG=$FORSETI_HOME/configs/forseti_conf_client.yaml

# Store the variables in $FORSETI_SECURITY_ENVIRONMENT_SH
# so all the users will have access to them
FORSETI_SECURITY_ENVIRONMENT_SH=${forseti_security_environment_sh}

cat << EOF > $FORSETI_SECURITY_ENVIRONMENT_SH
export FORSETI_HOME=$FORSETI_HOME
export FORSETI_CLIENT_CONFIG=$FORSETI_CLIENT_CONFIG
EOF

cat << EOF > $FORSETI_CLIENT_CONFIG
${forseti_conf_client_yaml}
EOF
