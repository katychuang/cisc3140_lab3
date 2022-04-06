BEGIN{
    FS = ",";
    OFS=","; 
    prev = ""; 
    count = 0;
} 
{ 
	# Reset count to 0 if the previous Make is different than current one
	if (prev != $4) 
		count = 0; 
	
	# Display up to only 3 cars per Make
	if (count < 3){ 
		# Sets the ranking values
		$1 = count+1; 
		prev = $4; 
		++count; 
		print $0; 
}
}
END{}