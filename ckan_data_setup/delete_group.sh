#!/bin/sh

PATH=/bin:/usr/bin
export PATH

. ./config

GROUP_ID=$1

http http://localhost/en/data/api/3/action/group_delete id=$GROUP_ID Authorization:$API_KEY_EN

http http://localhost/tc/data/api/3/action/group_delete id=$GROUP_ID Authorization:$API_KEY_TC

http http://localhost/sc/data/api/3/action/group_delete id=$GROUP_ID Authorization:$API_KEY_SC

http http://localhost/en/data/api/3/action/group_purge id=$GROUP_ID Authorization:$API_KEY_EN

http http://localhost/tc/data/api/3/action/group_purge id=$GROUP_ID Authorization:$API_KEY_TC

http http://localhost/sc/data/api/3/action/group_purge id=$GROUP_ID Authorization:$API_KEY_SC

