BEGIN{FS = ",";
	userInput = 1;
	carClass[1] = "Racer"; carClass[2] = "Engine"; 
	carClass[3] = "Body_Frame"; carClass[4] = "Mods";
	carClass[5] = "Mods_Overall"; carClass[6] = "Car_Overall";

}
#BODY
{
	total = 0;
	count = 1;
	if(NR==1){
		for(n = 1; n <= NF; n++){
			if(index($n, carClass[userInput]) != 0){
				idx[count] =  n;
				count++;
			}
		}
		next;
	}
        for(i = 1; i <= length(idx); i++){
        	total = total + $idx[i];
        }
        print total " "$7 " " $4 " " $5 " " $6;
}
END{}
