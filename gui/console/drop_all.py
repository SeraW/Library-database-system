import action
import config
import util


def drop_all():
    cursor = config.connection.cursor()

    with open(util.get_root_proj_file('drop_all.sql')) as f:
        lines = f.readlines()
        statements = util.get_all_sql_statements(lines)
        for statement in statements:
            util.execute_statement(cursor, statement)

    return action.PAUSE
