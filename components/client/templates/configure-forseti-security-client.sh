#!/usr/bin/env bash

# Store the variables in /etc/profile.d/forseti-security-environment.sh
# so all the users will have access to them
FORSETI_SECURITY_ENVIRONMENT_SH=/etc/profile.d/forseti-security-environment.sh

cat << EOF > $FORSETI_SECURITY_ENVIRONMENT_SH
export FORSETI_HOME=$HOME/${project_name_base}
export FORSETI_CLIENT_CONFIG=$FORSETI_HOME/configs/forseti_conf_client.yaml
EOF

source $FORSETI_SECURITY_ENVIRONMENT_SH

cat << EOF > $FORSETI_CLIENT_CONFIG
${forseti_conf_client_yaml}
EOF
