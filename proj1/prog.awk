BEGIN {
    FS = ","
    print "CarID" "|" "Year" "|" "Make" "|" "Model" "|"  > "title" 
}

{
    # sum of total score for each car
    if(NR !=1){
       totalScore = 0;
	for(n = 8; n <= NF; n++){
	   totalScore = totalScore + $n
	}
	print $7 "|" $4 "|" $5 "|" $6 "|" total > "ranking.txt"
	

     
}
