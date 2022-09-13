#!/bin/bash

ROOT_DIR=$(dirname $0)/..
MENU_DIR=$ROOT_DIR/menu

# load shared functions
. $ROOT_DIR/menu/shared_vars.sh

# QUERY ENV VARS (for customization [mainly when called in other scripts])
QUERY_EXIT_MSG=${QUERY_EXIT_MSG:-"Exit"}

menu() {
    while [ "$CHOICE" != "QUERY_EXIT" ]; do
        clear
        cat <<EOF
=================================================================
|
| RUN QUERIES
|
=================================================================

EOF

        echo "1) Run prebuilt queries"
        echo "2) Run custom query"
        echo " "
        echo "E) $QUERY_EXIT_MSG"
        echo " "

        echo -n "CHOICE> "
        read CHOICE

        if [ "$CHOICE" = "1" ]; then
            export QUERY_PREBUILT_EXIT_MSG="Go back to query menu"
            bash $MENU_DIR/queries_prebuilt.sh
        elif [ "$CHOICE" = "2" ]; then
             bash $MENU_DIR/queries_custom.sh
             . $FUNCTION/pause.sh
        elif [ "$CHOICE" = "E" ]; then
            exit 0
        fi

    done
}

start() {
    while [ 1 ]; do
        menu
    done
}

start