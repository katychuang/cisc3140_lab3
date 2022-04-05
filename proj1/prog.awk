BEGIN {
    FS = ","
    print "CarID" "|" "Year" "|" "Make" "|" "Model" "|"  > "title" 
}

{
    # summing up each category for the cars to create the rankings
    if(NR !=1){
       totalScore = 0;
	for(n = 8; n <= NF; n++){
	   totalScore = totalScore + $n
	}
	print $7 "|" $4 "|" $5 "|" $6 "|" totalScore > "ranking.txt"     
}

}
