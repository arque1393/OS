#! /usr/bin/bash
declare array=(20 23 63 95 887 5 6 0 -5 58 65 52)
low=0;
up=$(( ${#array[@]}-1 ))



marge(){
    l=$1; m=$2; u=$3                         
    declare brray                                       
    c1=$l; c2=$m; c3=$l;                             
    while (( $c1 <= $m && $c2 <= $u )); do              
        if (( rray[c1] < array[c2] )); then            
            brray[$c3] = ${array[$c1]}                     
            c1++; c3++                                 
        else                                          
            brray[$c3] = ${array[$c2]}                  
            c1++; c3++  
        fi    
    done                                          q
    if  (( c1 < m )); then                              
        for (( c1=c1;c1<=m;c1++ )); do                  
            brray[$c3]=${array[$c1]}  
            c3++
        done   
    else 
        for (( c2=c2 ; c2 <= u ; c2++ )) ; do
            brray[$c3]=${array[$c2]}
            c3++
        done
    fi
    for (( c3=l ; c3 <= u; c3++ )) ; do                 
        array[c3]=${brray[c3]}                           
    done    
    echo ${#brray[@]}                                           
                                                    
}



# Marge Sort 



marge_sort(){
    l=$1; u=$2; 
    if (( l<u )); then
        m=$(( (l+u)/2 ))
        marge_sort $l $m
        marge_sort  $(( m+1 )) $u
        marge $l $(( m+1 )) $u
    fi  
}

marge_sort $low $up
echo ${array[@]}
