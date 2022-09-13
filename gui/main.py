import action
import config
import util
from console import menu
from console import create_tables_2, create_views, drop_all, populate_tables, query_tables


def safe_exit():
    config.connection.cursor().close()
    config.connection.close()
    exit(0)


# maps choice key to choice handler function
CHOICE_MAPPING = {
    '1': drop_all.drop_all,
    '2': create_tables_2.create_tables,
    '3': populate_tables.populate_tables,
    '4': query_tables.query_tables,
    '5': create_views.create_views,
    'E': safe_exit
}


def main():
    while True:
        util.clear_screen()
        menu.show_main_menu()
        choice = input("")

        option_func = CHOICE_MAPPING.get(choice, None)
        if option_func:
            val = option_func()
            if val:
                should_return = action.process_action(val)
                if should_return:
                    return


if __name__ == "__main__":
    main()
