BEGIN 	{
	#Set the field seperator and output field seperator to commas
	FS=",";
	OFS=",";
	
	print "Rank,Car_ID,Year,Make,Model,Total,Racer,Engine,BodyFrame,Mods,Car_Overall,Mods_Overall"
	}
        #Ignore the first line of csv (header)
	NR==1 {next} 
	{

	#Variable Initialization
	sum = 0;
        racerSum = 0;
        engineSum = 0;
        bodyFrameSum = 0;
        modsSum = 0;

	#Ignoring the first 10 fields containing data not relevent to assignment, iterate through the data
  	for(i = 10; i <= NF; i++) { 	sum = sum + $i; 
					if (i >= 10 && i < 14) {racerSum = racerSum + $i;}
					else if (i >= 15 && i < 20) {engineSum = engineSum + $i;}
					else if (i >= 20 && i < 25) {bodyFrameSum = bodyFrameSum + $i;}
					else if (i >= 25 && i < NF) {modsSum = modsSum + $i;}
	};
	
	if ($7 == "Showcar") {next}

	#Print out the Details of the car, and the totals for specified values
	print $7, $4, $5, $6, sum, racerSum, engineSum, bodyFrameSum, modsSum, $14, $NF;
} 
END {
}

