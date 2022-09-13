#!/bin/bash

# DIRECTORY VARIABLES
# dirname $0 returns the path excluding the name of this file
ROOT_DIR=$(dirname $0)/..
QUERY_DIR=$ROOT_DIR/query
FUNCTION=$ROOT_DIR/menu/function

# ORACLEDB VARIABLES
# override these variables on your system by running: export VARNAME="value"
ORACLEDB_USERNAME=${ORACLEDB_USERNAME:-"username"}
ORACLEDB_PASSWORD=${ORACLEDB_PASSWORD:-"password"}
# ryerson's oracle db: oracle.scs.ryerson.ca
ORACLEDB_HOST=${ORACLEDB_HOST:-"oracle.scs.ryerson.ca"}
# default port: 1521
ORACLEDB_PORT=${ORACLEDB_PORT:-"1521"}
# default sid: orcl
ORACLEDB_SID=${ORACLEDB_SID:-"orcl"}
# if you want the logon type to something else, you can set set LOGON_TYPE=" AS <TYPE>" (requires leading space)
ORACLEDB_LOGON_TYPE=${ORACLEDB_LOGON_TYPE:-" "}
