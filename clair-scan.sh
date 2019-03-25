#!/bin/sh

HOST_IP=$(hostname -i)
IMAGE=${1//\//-}
TIMESTAMP=$(date '+%m-%d-%Y-%Hh%Mm%Ss')

clair-scanner --ip $HOST_IP -c http://clair-backend:6060 -r /tmp/${IMAGE}.${TIMESTAMP}.cve-scan.json $1
