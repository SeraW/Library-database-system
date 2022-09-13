import action
import config
import util


def create_views():
    cursor = config.connection.cursor()

    with open(util.get_root_proj_file('create_views.sql')) as f:
        lines = f.readlines()
        statements = util.get_all_sql_statements(lines)
        for statement in statements:
            util.execute_statement(cursor, statement)

    return action.PAUSE
