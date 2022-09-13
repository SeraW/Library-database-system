# cps510
CPS510 - Library Database System

Group Members:
- Sera Wong (sera.wong@ryerson.ca) - 500702293
- Sulaxan Pius (spius@ryerson.ca) - 500897523
- Jeesoo Kim (j17kim@ryerson.ca) - 500877550

## Scripts

- The [drop_all](./drop_all.sql) script can be ignored. It just provides all the commands to drop all tables in the
database in order of dependencies (reversed), i.e., tables which are not dependent by other tables will be dropped
first.

### Order of scripts

The scripts **must** be run in the below order, otherwise issues will emerge:
- [asset.sql](./asset.sql) (1)
- [user.sql](./user.sql) (2)
- REMAINING FILES CAN BE RUN IN ANY ORDER: (3-5)
  - [activity.sql](./activity.sql)
  - [facility.sql](./facility.sql)
  - [job_posting.sql](./job_posting.sql)

## Queries

Queries for all tables can be found in the [query](./query) directory.

## Shell Menu

The shell menu can be found in the [menu](./menu) directory. Run the [shellmenu.sh](./menu/shellmenu.sh) script to see
the menu.

## Python-based UI
The Python UI can be found in the [gui](./gui) directory. Run the [main.py](./gui/main.py) script to see the menu.

## Python-based GUI
The Python GUI can be found in the [gui](./gui) directory. Run the [gui_main.py](./gui/gui_main.py) script to see the menu.
