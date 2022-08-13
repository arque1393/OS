#! /usr/bin/bash
read -p "Enter a number : " b
read -p "Enter the power : " p
r=1
for i in $( seq $p);do 
r=$(( r*b ))
done
echo "power = $r"

