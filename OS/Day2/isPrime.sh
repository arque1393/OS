#/usr/bin/bash
# Program to check whether a number is prime or not 

 
read -p "Enter a number : " b
for (( i=2; i<b; i++ ))
do
if (( b%i == 0 ));then
printf "Number is not prime";
exit
fi
done
printf "Number is prime";