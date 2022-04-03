BEGIN {
        FS = ","
        OFS = ","
        printf("%s,%s,%s\n", "Car_ID","Total","Rank")
	rank = 1
}
{
        if(NR>1) {
        key = sprintf("%s", $7)
	total = 0
	for(i = 10; i < 14; i++){
		total+=$i
	}
        value = total

	for(i=1; i<=3; i++) {
		if(top3[i] == "" || top3[i] < value) {
			tmp = top3[i]
			top3[i] = value	    
			value = tmp
			
			tmp = keys[i]
			keys[i] = key
			key = tmp		
		}  
	}
	
    }
  
}
END {
 	for(i in top3)
 		printf("%s,%s,%d\n",keys[i],top3[i],rank++)
}
