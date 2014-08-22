#!/bin/sh

PATH=/bin:/usr/bin
export PATH

. ./config

ORGANIZATION_ID=$1

http http://localhost/en/data/api/3/action/organization_delete id=$ORGANIZATION_ID Authorization:$API_KEY_EN

http http://localhost/tc/data/api/3/action/organization_delete id=$ORGANIZATION_ID Authorization:$API_KEY_TC

http http://localhost/sc/data/api/3/action/organization_delete id=$ORGANIZATION_ID Authorization:$API_KEY_SC

http http://localhost/en/data/api/3/action/organization_purge id=$ORGANIZATION_ID Authorization:$API_KEY_EN

http http://localhost/tc/data/api/3/action/organization_purge id=$ORGANIZATION_ID Authorization:$API_KEY_TC

http http://localhost/sc/data/api/3/action/organization_purge id=$ORGANIZATION_ID Authorization:$API_KEY_SC

