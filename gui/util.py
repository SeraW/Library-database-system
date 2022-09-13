import os
import sys


def clear_screen():
    if os.name == "nt":
        # need to set to a variable to ignore output value
        _ = os.system("cls")
    else:
        # need to set to a variable to ignore output value
        _ = os.system("clear")


def pause():
    input("\nPress key to continue")


def get_root_python_proj_dir():
    path = os.path.dirname(sys.argv[0])
    # Handles case when the entrypoint Python file is called from the same directory as the file itself. In this case,
    # we would be getting the dirname of "file.py", which just returns an empty string. This, however, causes issues
    # when trying to get relative paths, so return "./" instead.
    if path == '':
        return './'

    return path


def get_root_proj_dir():
    return get_root_python_proj_dir() + '/..'


def get_root_proj_file(file: str):
    return get_root_proj_dir() + '/' + file


def get_all_sql_statements(lines):
    """
    Transforms all lines from a SQL file into valid SQL statements.

    :param lines: All lines from a file
    :return: List of statements
    """
    # join all lines with a space, strip any leading/trailing whitespace
    combined = ' '.join(lines).strip()
    # split at semicolons (which denote end of a SQL statement)
    statements = combined.split(';')
    # statements don't require semicolons at the end, so we can return the split list
    # note on comments: comments seem to be ignored automatically (as they should), so no need to remove them manually

    # remove empty statements (which happen because of an empty line at the end of the file)
    if '' in statements:
        statements.remove('')


    return statements


def execute_statement(cursor, statement):
    """
    Executes a statement given the connection cursor.

    :param cursor: The connection cursor
    :param statement: The statement to execute (without a trailing semicolon)
    """
    try:
        print(f'Executing: {statement}')
        # statements don't require having a semicolon at the end
        cursor.execute(statement)
        print('  SUCCESS!')
    except Exception as e:
        print(f'  Statement execution encountered error: {str(e)}')


def execute_query(cursor, statement):
    """
    Executes a query given the connection cursor and prints the output.

    :param cursor: The connection cursor
    :param statement: The query to execute (without a trailing semicolon)
    """
    try:
        print('***** Query *****')
        print(f'Executing: {statement}')
        # statements don't require having a semicolon at the end
        
        print('***** Query Result *****')
        print('Fields: ',end='')
        data=cursor.execute(statement)
        length=len(data.description)
        print(length)
        for column in data.description:
            print(column[0], end='') 
            if column == data.description[-1]:
                print(' ||')
            else:
                print(' | ', end='')
        
        cursor.execute(statement)
        rows = cursor.fetchall()
        for row in rows:
            print(row)
    except Exception as e:
        print(f'  Statement execution encountered error: {str(e)}')
