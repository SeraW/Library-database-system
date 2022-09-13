#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# dirname $0 returns the path excluding the name of this file
ROOT_DIR=$(dirname $0)/..

# load default env variables for OracleDB if they are not set
. $ROOT_DIR/menu/shared_vars.sh

cat $ROOT_DIR/views.sql | sqlplus64 "$ORACLEDB_USERNAME/$ORACLEDB_PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=$ORACLEDB_HOST)(Port=$ORACLEDB_PORT))(CONNECT_DATA=(SID=$ORACLEDB_SID)))$ORACLEDB_LOGON_TYPE"
