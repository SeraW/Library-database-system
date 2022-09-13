#!/bin/bash

# go to root directory of project (currently in the "compile" directory)
cd ..

# remove and create build directory
if [ -e "build" ]; then
    echo "Removing old build directory"
    rm -r build
fi

echo "Creating build directory"
mkdir "build"

# ask for compiled name
read -p "Specify compiled directory name, followed by [ENTER]: " COMPILED_DIRECTORY

echo "Creating compile directory"
mkdir "build/$COMPILED_DIRECTORY"
echo "Created!"

echo "Copying all files and appending header"
# loop through all the files
for file in $(find -L); do
    # ignore directories
    if [ -d $file ]; then
        continue;
    fi

    # ignore excluded files
    if ! python compile/compile_check_exclusion.py $file; then
        continue;
    fi

    echo "Processing $file"

    # create directory for file
    mkdir -p build/$COMPILED_DIRECTORY/$(dirname $file)

    # create file in build directory
    touch $file

    # get file extension
    FILENAME=$(basename $file)
    EXTENSION="${FILENAME##*.}"  # extract extension using shell parameter expansion

    HEADER_FILE="compile/header_$EXTENSION.txt"
    # check for header_{extension}.txt (the header to apply to files with {extension}); if it doesn't exist,
    # create and exit
    if [ ! -e "$HEADER_FILE" ]; then
        touch $HEADER_FILE
        echo "No $HEADER_FILE file exists; created."
        echo "Add the header to this file to append to files with extension $EXTENSION"
        exit 0
    fi

    # append header and original content; add to the file in the build directory
    # aside: having "." in the path should be fine (shouldn't change the directory position)
    #       "." exists since all $file start with ./ (for current directory)
    COMPILED_FILE=build/$COMPILED_DIRECTORY/$file

    cat $HEADER_FILE $file > $COMPILED_FILE
    if [ $EXTENSION = "sh" ]; then
        echo "  Detected shell file, converting CRLF to LF"
        # -i to make changes in file itself
        sed -i 's/\r$//' $COMPILED_FILE
        echo "  Done!"
    fi

#     if [ $EXTENSION = "sh" ]; then
#         # cat header
#         cat $HEADER_FILE > $COMPILED_FILE
#
#         # check if the first line is shebang, if so, remove it and append to COMPILED_FILE
# #         first_line=$(head -n 1 $file)
# #         if [[ "$file_line" =~ \#!\/.*\/(sh|bash) ]]; then
# #             # append everything but the first line
# #             tail +2 $file >> $COMPILED_FILE
# #         else
# #             # otherwise just append entire file to COMPILED_FILE
# #             cat $file >> $COMPILED_FILE
# #         fi
#
#         echo "  Detected shell file, converting CRLF to LF"
#         # -i to make changes in file itself
#         sed -i 's/\r$//' $COMPILED_FILE
#         echo "  Done!"
#     else
#         # regular cat
#         cat $HEADER_FILE $file > $COMPILED_FILE
#     fi

    echo "Processed $file"
done

echo "Zipping final files"
cd build  # change to build directory (to create the zip file there)
zip -r ${COMPILED_DIRECTORY}.zip $COMPILED_DIRECTORY

echo " "
echo "Done! Finished in ${SECONDS}s"  # SECONDS is an internal variable containing the number of seconds the script has
                                      # run for
