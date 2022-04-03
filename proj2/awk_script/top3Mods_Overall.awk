BEGIN {
        FS = ","
        OFS = ","
        printf("%s,%s,%s,%s,%s\n", "Rank", "Car_ID", "Email", "Name","Mods_Overall")
	rank = 1
}
{
        if(NR>1) {
        key = sprintf("%s,%s,%s", $7, $2, $3)
        value = $34

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
 		printf("%d,%s,%d\n",rank++,keys[i],top3[i])
}
