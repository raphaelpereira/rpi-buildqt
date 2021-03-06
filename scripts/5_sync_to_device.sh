#!/bin/bash

set -e

SCRIPTDIR=$(dirname "$0")
source $SCRIPTDIR/env.sh

echo
echo "== Copy qt =="
echo
rsync -avztr --delete --rsh="/usr/bin/sshpass -p ${RPIDEV_DEVICE_PW} ssh -o StrictHostKeyChecking=no -l ${RPIDEV_DEVICE_USER}" ${QT_INSTALL_DIR}/* ${RPIDEV_DEVICE_ADDRESS}:${QT_DEVICE_DIR}

echo
echo "== Copy poc player =="
echo
sshpass -p ${RPIDEV_DEVICE_PW} scp ${RPIDEV_SRC}/piomxtextures/piomxtextures_pocplayer/piomxtextures_pocplayer ${RPIDEV_DEVICE_USER}@${RPIDEV_DEVICE_ADDRESS}:~/
