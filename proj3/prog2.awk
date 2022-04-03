BEGIN{	
#Sets global variables
	#userInput by default is 3
	#Can be changed via command line menu
	userInput = 3;
	count=1; 
	word="Make"
}
#BODY
{
	#Checks if theres a new word in current row
	if(word!=$5){
		count=1;
		word=$5;
		print $0;
	}
	#If the count is equal or greater than 3, skips to the next line
	else if(count >= userInput){
		false;
	}
	#Prints rows and increments count
	else{
		print $0;
		count++;
	}
}
END{}
