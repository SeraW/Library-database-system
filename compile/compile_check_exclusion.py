#!/bin/python
import re
import sys

EXCLUDED_FILES = [
    "./.gitignore",
    "./.git[/]?[.]*", # . matches any character except newline
    "./compile[/]?[.]*",
    "./build[/]?[.]*",
    "./.idea[/]?[.]*",
    "./user_data[/]?[.]*"
]


"""
Returns exit code 0 if the specified file is not excluded, 1 otherwise
"""
def main():
    if len(sys.argv) < 2:
        print("no file path specified")
        exit(1)

    local_path = sys.argv[1]

    for file_regex in EXCLUDED_FILES:
        if re.match(file_regex, local_path):
            exit(1)

    exit(0)


if __name__ == '__main__':
    main()
