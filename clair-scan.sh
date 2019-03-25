#!/bin/sh

if [ -z $1 ]; then
    echo "Docker image not set, exiting..."
    exit 0
fi

HOST_IP=$(hostname -i)
IMAGE=${1//\//-}
TIMESTAMP=$(date '+%m-%d-%Y-%Hh%Mm%Ss')

clair-scanner --ip $HOST_IP -c http://clair-backend:6060 -r /tmp/${IMAGE}.${TIMESTAMP}.cve-scan.json $1
