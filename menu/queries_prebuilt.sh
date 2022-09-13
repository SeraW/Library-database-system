#!/bin/bash

# dirname $0 returns the path excluding the name of this file
ROOT_DIR=$(dirname $0)/..
QUERY_DIR=$ROOT_DIR/query

# load default env variables for OracleDB if they are not set
. $ROOT_DIR/menu/shared_vars.sh

# INTERNAL VARIABLES:
# LISTING (array of all prebuilt queries)
# LISTING_LENGTH (length of LISTING)

# QUERY PREBUILT ENV VARS (for customization [mainly when called in other scripts])
QUERY_PREBUILT_EXIT_MSG=${QUERY_PREBUILT_EXIT_MSG:-"Exit"}

constructListing() {
    for file in $(ls $QUERY_DIR/*.sql -1); do
        LISTING+=( "$file" )
    done

    LISTING_LENGTH=${#LISTING[@]}
}

menu() {
    while [ "$CHOICE" != "QUERIES_PREBUILT_EXIT" ]; do
        clear
        echo "================================================================="
        echo "| Options:"

        # loop through indicies
        for i in ${!LISTING[@]}; do
            FILE=${LISTING[$i]}
            FILE_BASENAME=$(basename $FILE)
            echo "|   $i) ${FILE_BASENAME/%.sql/}" # replace suffix
        done

        echo "|   E) $QUERY_PREBUILT_EXIT_MSG"

        echo "================================================================="

        echo -n "CHOICE> "
        read CHOICE

        if [ "$CHOICE" == "E" ]; then
            exit 0
        fi

        # test if it's a valid integer
        if [[ ! $CHOICE =~ ^[0-9]+$ ]]; then
            echo "Invalid input"
            continue
        fi

        # no need to check < 0 since it's checked in the integer test above
        if [[ "$CHOICE" -ge $LISTING_LENGTH ]]; then
            echo "Choice must be between 0 and $LISTING_LENGTH"
            continue
        fi

        echo "RUNNING: ${LISTING[$CHOICE]}"
        cat ${LISTING[$CHOICE]} | sqlplus64 "$ORACLEDB_USERNAME/$ORACLEDB_PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=$ORACLEDB_HOST)(Port=$ORACLEDB_PORT))(CONNECT_DATA=(SID=$ORACLEDB_SID)))$ORACLEDB_LOGON_TYPE"

        . $FUNCTION/pause.sh
    done
}

start() {
    constructListing

    while [ 1 ]; do
        menu
    done
}

start
