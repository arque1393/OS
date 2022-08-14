#! /usr/bin/bash
declare array=(20 23 63 95 887 5 6 0 -5 58 65 52)
low=0;
up=$(( ${#array[@]} - 1 ))

function marge(){
    local l=$1; local m=$2; local u=$3                         
    declare brray                                       
    local c1=$l; local c2=$(( m+1 )); local c3=$l;                             
    while (( c1 <= m && c2 <= u )); do                     
        if (( array[$c1] < array[$c2] )); then            
            brray[$c3]=${array[$c1]}                     
            (( c1++ )) ; (( c3++ ))                                 
        else                                          
            brray[$c3]=${array[$c2]}                  
            (( c2++ )); (( c3++ ))
        fi    
    done                                          
    if  (( c1 < m )); then                              
        for (( c1=c1; c1<=m; c1++ )); do                  
            brray[$c3]=${array[$c1]}  
            (( c3++ ))
        done   
    else 
        for (( c2=c2 ; c2 <= u ; c2++ )) ; do
            brray[$c3]=${array[$c2]}
            (( c3++ ))
        done
    fi
    for (( c3=l ; c3 <= u ; c3++ )) ; do                 
        array[$c3]=${brray[c3]}                           
    done    
    #echo ${#brray[@]}   
}

function marge_sort(){
    local l=$1; local u=$2; 
    if (( l<u )); then
        local m=$(( (l+u)/2 ))
        marge_sort $l $m
        marge_sort  $(( m+1 )) $u
        marge $l $(( m+1 )) $u
    fi  
}

marge_sort $low $up

echo ${array[@]}
