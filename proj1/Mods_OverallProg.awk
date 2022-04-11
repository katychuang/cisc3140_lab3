BEGIN{FS = ",";
    count = 1;
    phrase = "Mods_Overall"
}
{
	total =0;
	if(NR==1){
	   for(i=1;i<=NF;i++){
		if(index($i, phrase) != 0){
		  arr[count] = i
	          count++
		    }
		}
		next
	}
	for(i=1;i<=length(arr);i++){
	   total = total + $arr[i]
}
	printf "%-6s %-6s %-6s %-6s %-12s %-12s\n", "tmp", total, $7, $4, $5, $6
} 	
END{}
