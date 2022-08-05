echo -n "enter a number : "
read b
echo -n "enter second number : "
read a
printf "1) Add \n2) Sub \n3)Mul \n4)Div\nEnter ypou choice :" 
read c
echo -n "Result :"
case $c in 
2 ) echo `expr $b - $a`;;
3 ) echo `expr $b\*$a`;;
1 ) echo `expr $b+$a`;;
4 ) echo `expr $b/$a`;;
* ) echo "wrong choice";;
esac