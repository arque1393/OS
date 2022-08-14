#! /usr/bin/bash 
# Program to check whether a input file or directory
echo 'Enter a name :';
read a;
if [ -f $a ]; then 
    echo 'This is a file';
elif [ -d $a ]; then
    echo 'This is a directory';
else 
    echo 'This is neither file nor directory ';
fi