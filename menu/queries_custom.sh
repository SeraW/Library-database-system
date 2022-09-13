#!/bin/bash

# dirname $0 returns the path excluding the name of this file
ROOT_DIR=$(dirname $0)/..

# load default env variables for OracleDB if they are not set
. $ROOT_DIR/menu/shared_vars.sh

start() {
    echo -n "ENTER QUERY> "
    read QUERY

    # wrap QUERY in quotes so it doesn't get interpreted by bash
    echo "$QUERY" | sqlplus64 "$ORACLEDB_USERNAME/$ORACLEDB_PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=$ORACLEDB_HOST)(Port=$ORACLEDB_PORT))(CONNECT_DATA=(SID=$ORACLEDB_SID)))$ORACLEDB_LOGON_TYPE"
}

start
