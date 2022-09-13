#!/bin/sh

# the root dir of the project
ROOT_DIR=$(dirname $0)/..
MENU_DIR=$ROOT_DIR/menu

# load default env variables for OracleDB if they are not set
. $ROOT_DIR/menu/shared_vars.sh

MainMenu() {
    while [ "$CHOICE" != "START" ]
    do
    clear
    echo "================================================================="
    echo "|                 Oracle All Inclusive Tool                     |"
    echo "|           Main Menu - Select Desired Operation(s):            |"
    echo "|        <CTRL-Z Anytime to Enter Interactive CMD Prompt>       |"
    echo "-----------------------------------------------------------------"
    echo " $IS_SELECTEDM M) View Manual"
    echo " "
    echo " $IS_SELECTED1 1) Drop Tables/Views"
    echo " $IS_SELECTED2 2) Create Tables"
    echo " $IS_SELECTED3 3) Populate Tables"
    echo " $IS_SELECTED4 4) Query Tables"
    echo " $IS_SELECTED5 5) Create Views"
    echo " "
    echo " $IS_SELECTEDX X) Force/Stop/Kill Oracle DB"
    echo " "
    echo " $IS_SELECTEDE E) End/Exit"
    echo "Choose: "

    read CHOICE

    if [ "$CHOICE" = "0" ]; then
        echo "Nothing Here"    
        . $FUNCTION/pause.sh
    elif [ "$CHOICE" = "1" ]; then
        bash $MENU_DIR/drop_tables.sh
        . $FUNCTION/pause.sh
    elif [ "$CHOICE" = "2" ]; then
        bash $MENU_DIR/create_tables.sh
        . $FUNCTION/pause.sh
    elif [ "$CHOICE" = "3" ]; then
        bash $MENU_DIR/populate_tables.sh
        . $FUNCTION/pause.sh
    elif [ "$CHOICE" = "4" ]; then
        export QUERY_EXIT_MSG="Go back to main menu"
        bash $MENU_DIR/queries.sh
    elif [ "$CHOICE" = "5" ]; then    
        bash $MENU_DIR/create_views.sh
        . $FUNCTION/pause.sh
    elif [ "$CHOICE" = "E" ]; then
        exit 0
    fi

    done
}

#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--

ProgramStart() {
   # StartMessage
    while [ 1 ]
    do
        MainMenu
    done
}
ProgramStart
