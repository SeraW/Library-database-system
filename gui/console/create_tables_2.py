import config
import util

# listed in order in which the tables should be created
CREATE_TABLE_FILES = [
    'asset.sql',
    'user.sql',
    'job_posting.sql',
    'activity.sql',
    'facility.sql'
]


def create_tables():
    cursor = config.connection.cursor()

    for create_table_file in CREATE_TABLE_FILES:
        print(f'Creating table specified by: {create_table_file}')
        with open(util.get_root_proj_file(create_table_file)) as f:
            lines = f.readlines()
            statements = util.get_all_sql_statements(lines)
            for statement in statements:
                util.execute_statement(cursor, statement)

    return True
