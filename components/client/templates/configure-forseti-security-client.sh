#!/usr/bin/env bash

set -o errexit
set -o nounset

USER=${user}
FORSETI_INSTALL_DIR=${forseti_install_dir}
FORSETI_CLIENT_CONFIG=$FORSETI_INSTALL_DIR/configs/forseti_conf_client.yaml

# Store the variables in $FORSETI_SECURITY_ENVIRONMENT_SH
# so all the users will have access to them
FORSETI_SECURITY_ENVIRONMENT_SH=${forseti_security_environment_sh}

cat << EOF > $FORSETI_SECURITY_ENVIRONMENT_SH
export FORSETI_INSTALL_DIR=$FORSETI_INSTALL_DIR
export FORSETI_CLIENT_CONFIG=$FORSETI_CLIENT_CONFIG
EOF

cat << EOF > $FORSETI_CLIENT_CONFIG
${forseti_conf_client_yaml}
EOF
