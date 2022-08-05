echo -n "Enter a number : "
read b
echo -n "Enter the power : "
read p
r=1
for i in $( seq $p);do 
r=$(( r*b ))
done
echo "power = $r"

