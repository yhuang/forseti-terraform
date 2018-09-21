#!/usr/bin/env bash

FORSETI_SECURITY_ENVIRONMENT_SH=/etc/profile.d/forseti-security-environment.sh
source $FORSETI_SECURITY_ENVIRONMENT_SH

# set -x enables a mode of the shell where all executed commands are printed to the terminal.
# With this  enabled, we should not put anything private/secret in the commands called because
# they will be logged.
set -x

if [ ! -f "$FORSETI_SERVER_CONFIG" ]; then
    echo echo "ERROR: Could not find configuration file $FORSETI_SERVER_CONFIG." >&2
    exit 1
fi

# Restart the server to avoid auth problem, this is a temp fix to
# https://github.com/GoogleCloudPlatform/forseti-security/issues/1832
sudo systemctl restart forseti.service

# Wait until the service is started
sleep 10s

# Reload the server configuration settings
forseti server configuration reload

# Set the output format to json
forseti config format json

# Purge inventory.
# Use retention_days from configuration yaml file.
forseti inventory purge

# Run inventory command
MODEL_NAME=$(/bin/date -u +%Y%m%dT%H%M%S)
echo "Running Forseti Inventory..."
forseti inventory create --import_as $MODEL_NAME
echo "Finished running Forseti Inventory."
sleep 5s

GET_MODEL_STATUS="forseti model get $MODEL_NAME | python -c \"import sys, json; print json.load(sys.stdin)['status']\""
MODEL_STATUS=`eval $GET_MODEL_STATUS`

if [ "$MODEL_STATUS" == "BROKEN" ]; then
    echo "ERROR: Model is broken. Please contact discuss@forsetisecurity.org for support."
    exit
fi

# Run model command
echo "Using model $MODEL_NAME to run Forseti Scanner..."
forseti model use $MODEL_NAME
# Sometimes a lag between when the model
# successfully saves to the database.
sleep 10s
echo "Forseti config: $(forseti config show)"

# Run scanner command
echo "Running Forseti Scanner..."
forseti scanner run
echo "Finished running Forseti Scanner."
sleep 10s

# Run notifier command
echo "Running Forseti Notifier..."
forseti notifier run
echo "Finished running Forseti Notifier."
sleep 10s

# Clean up the model tables
echo "Cleaning up model tables..."
forseti model delete ${MODEL_NAME}
