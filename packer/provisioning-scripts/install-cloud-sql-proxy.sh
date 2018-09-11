#!/usr/bin/env bash

CLOUD_SQL_PROXY=/usr/local/bin/cloud_sql_proxy

wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64
mv cloud_sql_proxy.linux.amd64 $CLOUD_SQL_PROXY
chmod a+x $CLOUD_SQL_PROXY
