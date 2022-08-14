#! /usr/bin/bash
# Program to check whether a number divisible by 7
echo 'Enter a number';
read a;
if (( $a%7 == 0 ));then  echo 'divisible by 7' 
else echo 'not divisible by 7' ;fi