read -p "Enter the number : " n
r=1
for i in $( seq $n);do 
r=$(( r*i ))
done
echo "Factorial = $r"