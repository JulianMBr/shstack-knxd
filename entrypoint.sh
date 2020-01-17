#!/bin/sh

echo "Starting knxd service."

ARGS=$@
echo "ARGS: $ARGS"

CONFIG_PATH=/etc/knxd

if [ ! -e "$CONFIG_PATH/knxd.ini" ]; then
    echo "No config file found, please provide an config file."
    cp /root/knxd.ini $CONFIG_PATH/;
    exit 1;
fi

chown knxd:knxd /etc/knxd/knxd.ini

echo "Press <ctrl>-c to abort"
su -s /bin/sh -c "knxd $ARGS" knxd

# Workaround because knxd always forks to background
while [ true ] ; do
    sleep 5
done

