#!/bin/bash

/usr/sbin/envsubst </tmp/kairosdb.properties >/opt/kairosdb/conf/kairosdb.properties
echo $(cat /opt/kairosdb/conf/kairosdb.properties)
/opt/kairosdb/bin/kairosdb.sh run

