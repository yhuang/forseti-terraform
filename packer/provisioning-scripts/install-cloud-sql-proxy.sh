#!/usr/bin/env bash

wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64
mv cloud_sql_proxy.linux.amd64 /usr/local/bin/cloud_sql_proxy
chmod a+x /usr/local/bin/cloud_sql_proxy
