import action
import config
import util
import os

def custom_queries():
    print("Please type your query below and hit enter.")
    myquery = input("")
    if myquery.casefold() == 'e'.casefold():
        return action.CONTINUE  # go back to query_tables menu
  
    cursor = config.connection.cursor()    
    statement=myquery
    util.execute_query(cursor, statement)
    
    return action.PAUSE
