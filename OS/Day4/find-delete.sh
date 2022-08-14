#! /usr/bin/bash 
## Title +: Find and delete a user given element from an array 
read -p "Please Enter the number of element in array :" n
for (( i=0; i<n; i++ )); do 
read -p "Enter $i th element : " array[i]
done
echo "Original Array : ${array[@]}"
read -p "Enter the element to delete :" d
for (( i=0; i<n; i++ )) ; do 
if (( array[i]==d ));then 
unset array[i]
echo "After deletion Array is : ${array[@]}"
exit
fi
done
echo "Element not found. Array remain unchanged"