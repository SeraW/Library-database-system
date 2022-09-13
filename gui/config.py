"""
run
python -m pip install cx_Oracle --upgrade
on windows, or
python3 -m pip install cx_Oracle --upgrade
for linux and mac

set environment variables on windows before running
you may need to restart computer after setting environment variables
make sure you are on VPN before connecting to Ryerson database
you will know that the connection has worked if you see the connection version printed

"""

import os
import cx_Oracle

connection = None

# default environment variables are set, but you can override them
# Ryerson database is oracle.scs.ryerson.ca
ORACLE_HOSTNAME = os.environ.get("ORACLE_HOSTNAME", 'oracle.scs.ryerson.ca')
# Ryerson port num is 1521
ORACLE_PORT = os.environ.get("ORACLE_PORT", 1521)
# Ryerson SID is orcl
ORACLE_SID = os.environ.get("DATABASE_SID", "orcl")

ORACLE_INIT = os.environ.get("ORACLE_INIT")

if ORACLE_INIT != None:
    cx_Oracle.init_oracle_client(lib_dir=ORACLE_INIT)

# try to see if environment variables are set
try:
    ORACLE_USERNAME = (os.environ["ORACLE_USERNAME"])
    ORACLE_PASSWORD = (os.environ["ORACLE_PASSWORD"])
except KeyError:
    print("Please set environment variable")
    exit(1)

# sysdba logon type
IS_SYSDBA = os.environ.get("ORACLE_SYSDBA", None)

# connect to Ryerson database
try:
    conn_kwargs = {}
    if IS_SYSDBA:
        conn_kwargs["mode"] = cx_Oracle.SYSDBA

    makedsn = cx_Oracle.makedsn(ORACLE_HOSTNAME, ORACLE_PORT, ORACLE_SID)
    connection = cx_Oracle.connect(ORACLE_USERNAME, ORACLE_PASSWORD, makedsn, **conn_kwargs)
    print(connection.version)

except cx_Oracle.Error as error:
    print(error)
