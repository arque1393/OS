#! /usr/bin/bash 
## Title +: Find Sum and avarage of user given array 
read -p "Please Enter the number of element in array: " n
for (( i=0; i<n; i++ )); do 
read -p "Enter $i th element : " array[i]
sum=$(( sum+array[i] ))
done
echo "Sum = $sum"
echo -n "Avg = "
bc -l <<< "$sum/$n"