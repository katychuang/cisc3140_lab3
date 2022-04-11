BEGIN {
	# Read Input file by , as separator
        FS = ","
	# Output data and separate bt comma
        OFS = ","
	# Display the header to Output file
        printf("%s,%s,%s,%s,%s\n", "Rank", "Car_ID", "Email", "Name","Mods_Overall")
	rank = 1
}
{
        # Ignore header and the car which ID is "showcar"
	if(NR>1 && $7 != "Showcar") {
	# Store the output value to variable key
        key = sprintf("%s,%s,%s", $7, $2, $3)
        # Mods_Overall
	value = $34

	# Get top 3 value and store into array
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
	# display the top3 value
 	for(i in top3)
 		printf("%d,%s,%d\n",rank++,keys[i],top3[i])
}
