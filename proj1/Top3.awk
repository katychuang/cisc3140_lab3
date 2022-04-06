BEGIN{	
    cnt=1; 
    phrase="Maker"
}

{
	#Checks if theres a new word in current row
	if(phrase!=$5){
		cnt=1;
		phrase=$5;
               	printf "%-6s %-6s %-6s %-6s %-12s %-15s\n",\
		cnt, $2, $3, $4, $5, $6;
	}
	
	else if(cnt >= 3){
		false;
	}	
	else{
		cnt++
		printf "%-6s %-6s %-6s %-6s %-12s %-12s\n", \
		cnt, $2, $3, $4, $5, $6;
	}
}
END{}
