#!/bin/bash
if [ "$DATABASE_URL" = "" ]; then
    echo "** Missing DATABASE_URL"
    exit 1
fi

# extract the protocol
proto="$(echo $DATABASE_URL | grep :// | sed -e's,^\(.*://\).*,\1,g')"
# remove the protocol
url="$(echo ${DATABASE_URL/$proto/})"
# extract the user (if any)
user="$(echo $url | grep @ | cut -d@ -f1)"

export DB_PASS="$(echo $user | grep : | cut -d: -f2)"
export DB_USER="$(echo $user | grep : | cut -d: -f1)"

# extract the host and port
hostport="$(echo ${url/$user@/} | cut -d/ -f1)"
# by request host without port
export DB_HOST="$(echo $hostport | cut -d: -f1)"
# by request - try to extract the port
DB_PORT="$(echo $hostport | grep : | cut -d: -f2)"
export DB_PORT=${DB_PORT:=5432}

# extract the path (if any)
export DB_DATABASE="$(echo $url | grep / | cut -d/ -f2-)"

cd zotonic
./bin/zotonic compile

exec ./bin/zotonic $@
