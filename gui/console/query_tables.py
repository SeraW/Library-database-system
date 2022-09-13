import action
import util
from . import prebuilt_queries
from . import custom_queries


def show_query_table_menu():
    print("""
===============================================
|                                             |
|          Library Database System            |
|                QUERY TABLES                 |
|                                             |
===============================================
Options:
    1) Run prebuilt queries
    2) Run custom queries

    E) Go back to main menu

""")
    print("Option > ", end='')


CHOICE_MAPPING = {
    '1': prebuilt_queries.prebuilt_queries,
    '2': custom_queries.custom_queries,
    'E': lambda: action.GO_BACK
}


def query_tables():
    while True:
        util.clear_screen()
        show_query_table_menu()
        choice = input("")

        option_func = CHOICE_MAPPING.get(choice, None)
        if option_func:
            val = option_func()
            if val:
                should_return = action.process_action(val)
                if should_return:
                    return action.CONTINUE
