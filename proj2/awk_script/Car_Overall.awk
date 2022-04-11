BEGIN {
        FS = ","
        OFS = ","
        printf("%s,%s,%s\n", "Car_ID","Car_Overall","Rank")
	rank = 1
}
{
        if(NR>1 && $7 != "Showcar") {
        key = sprintf("%s", $7)
        value = $14

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
