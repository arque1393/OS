#! /usr/bin/bash
# Program to check whether a number divisible by 7 and 5
echo 'Enter a number';
read a;
if (( a%7 == 0 && a%5==0 ));then  
echo 'divisible by 7 and 5' ;
else echo 'not divisible by 7 and 5' ;
fi

