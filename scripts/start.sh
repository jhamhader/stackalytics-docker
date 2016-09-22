#!/bin/sh

memcached -m $STACKALYTICS_MEMCACHED_MEMORY -M -l 127.0.0.1 -P /opt/stack/memcached.pid -d

stackalytics-processor --config-file /data/stackalytics.conf
stackalytics-dashboard --config-file /data/stackalytics.conf

