#! /usr/bin/bash 
# Program to find largest among 3 numbers
echo 'enter 3 number ';
read a b c;
if [ $a -gt $b -a $a -gt $c ]; then
    echo $a is grater 
elif [ $b -gt $c ]; then
    echo $b is grater
else 
    echo $c is grater
fi