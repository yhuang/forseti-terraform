#!/usr/bin/env bash

FORSETI_DIR=$(pwd)/forseti-security

git clone https://github.com/GoogleCloudPlatform/forseti-security.git
cd $FORSETI_DIR
git fetch --all
git checkout tags/v$FORSETI_VERSION

chmod -R ug+rwx $FORSETI_DIR/configs $FORSETI_DIR/rules

# Install Forseti
python setup.py install
