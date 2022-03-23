BEGIN {
    FS = "," 
}

{
    # sum of total score for each car
    ovScore = $8 + $9 + $10 + $11 + $12 + $13 + $14 + $15 + $16 + $17 + $18 + $19 + $20 + $21 + $22 + $23 + $24 + $25 + $26 + $27 + $28 + $29 + $30 + $31 + $32;
    if(NR==1)
        printf ""
    else
        printf "%-10s %-7s %-15s %-15s %-5d\n", $7, $4, $5, $6, ovScore
}