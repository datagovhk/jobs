#!/bin/sh

PATH=/bin:/usr/bin
export PATH

. ./config

DATASET_ID=$1

http http://localhost/en/data/api/3/action/package_delete id=$DATASET_ID Authorization:$API_KEY_EN

http http://localhost/tc/data/api/3/action/package_delete id=$DATASET_ID Authorization:$API_KEY_TC

http http://localhost/sc/data/api/3/action/package_delete id=$DATASET_ID Authorization:$API_KEY_SC

