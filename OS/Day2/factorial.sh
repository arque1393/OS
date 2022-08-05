echo -n "Enter the number : "
read n
r=1
for i in $( seq $n);do 
r=$(( r*i ))
done
echo "Factorial = $r"