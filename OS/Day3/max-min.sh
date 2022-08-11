#! /usr/bin/bash 
## Title +: Find min and max value of User given array 
max=-99999999999999; min=999999999999999
read -p "Please Enter the number of element in array: " n
for (( i=0; i<n; i++ )); do 
read -p "Enter $i th element : " array[i]
if (( max < array[i] )); then  max=${array[i]}; fi;
if (( min > array[i] )); then  min=${array[i]}; fi;
done
echo "Max = $max"
echo "Min = $min"
