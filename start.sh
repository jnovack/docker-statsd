#!/bin/sh

if [ ! -z "$PORT_GRAPHITE" ]; then
    sed -i "s/PORT_GRAPHITE/$PORT_GRAPHITE/g" /opt/statsd.conf
else
    sed -i "s/PORT_GRAPHITE/2003/g" /opt/statsd.conf
fi

if [ ! -z "$HOST_GRAPHITE" ]; then
    sed -i "s/HOST_GRAPHITE/$HOST_GRAPHITE/g" /opt/statsd.conf
else
    sed -i "s/HOST_GRAPHITE/graphite/g" /opt/statsd.conf
fi

if [ ! -z "$PORT_STATSD" ]; then
    sed -i "s/PORT_STATSD/$PORT_STATSD/g" /opt/statsd.conf
else
    sed -i "s/PORT_STATSD/8125/g" /opt/statsd.conf
fi

if [ ! -z "$HOST_PREFIX" ]; then
    sed -i "s/HOST_PREFIX/$HOST_PREFIX/g" /opt/statsd.conf
else
    sed -i "s/HOST_PREFIX/$HOSTNAME/g" /opt/statsd.conf
fi

if [ ! -z "$FLUSH" ]; then
    sed -i "s/FLUSH/$FLUSH/g" /opt/statsd.conf
else
    sed -i "s/FLUSH/10000/g" /opt/statsd.conf
fi

if [ ! -z "$DEBUG" ]; then
    sed -i "s/DEBUG/$DEBUG/g" /opt/statsd.conf
else
    sed -i "s/DEBUG/false/g" /opt/statsd.conf
fi

if [ ! -z "$DUMP" ]; then
    sed -i "s/DUMP/$DUMP/g" /opt/statsd.conf
else
    sed -i "s/DUMP/false/g" /opt/statsd.conf
fi

echo "cat /opt/statsd.conf..."
cat /opt/statsd.conf
/usr/local/bin/statsd /opt/statsd.conf