#! /usr/bin/bash 
# Program to check a user given number odd or even 
echo 'Enter a number' ;
read b;
if (( $b%2 )); then
    echo 'The number is odd' ;
else
    echo 'the number is even';
fi