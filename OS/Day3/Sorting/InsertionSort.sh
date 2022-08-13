array=(20 23 63 95 887 5 6 0 -5 58 65 52)

n=${#array[@]}



for (( i= 0 ; i<n ; i++ ))
do 
    key=${array[$i]}
    j=$(( i-1 ))
    
    
    while (( j >= 0 && key < array[j] ))
    do 
        array[$(( j + 1 ))]=${array[$j]}
        (( j-- ))
    
    done

    array[$(( j + 1 ))]=$key
done



echo "${array[@]}"