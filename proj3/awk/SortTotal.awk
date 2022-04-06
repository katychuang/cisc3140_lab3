BEGIN{
    FS = ",";
    OFS=","; 
    prev = ""; 
    count = 0;
} 
{ 
	if (prev != $4) 
		count = 0; 
	if (count < 3){ 
		$1 = count+1; 
		prev = $4; 
		++count; 
		print $0; 
}
}
END{}