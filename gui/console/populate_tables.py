import action
import config
import util


def populate_tables():
    cursor = config.connection.cursor()
    with open(util.get_root_proj_file('insert_data.sql')) as f:
        lines = f.readlines()
        statements = util.get_all_sql_statements(lines)
        for statement in statements:
            util.execute_statement(cursor, statement)
            config.connection.commit()
            
    return action.PAUSE
