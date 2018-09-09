#!/usr/bin/env bash

touch /var/log/forseti.log
chown $USER:root /var/log/forseti.log

cat > /etc/logrotate.d/forseti << LOGROTATE
/var/log/forseti.log {
  daily
  rotate 30
  missingok
  notifempty
  create 640 $USER root
}
LOGROTATE

chmod 644 /etc/logrotate.d/forseti
logrotate /etc/logrotate.conf
