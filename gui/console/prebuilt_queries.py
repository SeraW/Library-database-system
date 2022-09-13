import action
import config
import util
import os

# fileList holds the query file names
fileList=[]


def constructListing():
    n=0
    print("==============================================================")
    print("| Options:")
    for filename in os.listdir(util.get_root_proj_file("query")):
        fileList.append(filename)
        print("|   " + str(n) + ") " + filename.replace('.sql', ''))
        n+=1
    print("|   E) Go back to query menu")
    print("==============================================================")


def prebuilt_queries():
    constructListing()

    # check for correct input
    choice = input("CHOICE > ")

    if choice.casefold() == 'e'.casefold():
        return action.CONTINUE  # go back to query_tables menu

    if not choice.isnumeric():
        print("Please enter a number")
        return action.PAUSE

    choice = int(choice)
    if choice > len(fileList):
        print("Invalid input")
        return action.PAUSE

    cursor = config.connection.cursor()

    with open(util.get_root_proj_file("query/" + fileList[choice])) as f:
        lines = f.readlines()
        statements = util.get_all_sql_statements(lines)
        for statement in statements:            
            util.execute_query(cursor, statement)            
            print(".......................................................")
            print(" ")

    return action.PAUSE
