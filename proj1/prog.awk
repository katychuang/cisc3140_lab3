BEGIN 	{
	FS=",";
	OFS=",";
	}
	NR==1 {next}
{
	sum = 0;
        racerSum = 0;
        engineSum = 0;
        bodyFrameSum = 0;
        modsSum = 0; 
  	for(i = 10; i <= NF; i++) { 	sum = sum + $i; 
					if (i >= 10 && i < 14) {racerSum = racerSum + $i;}
					else if (i >= 15 && i < 20) {engineSum = engineSum + $i;}
					else if (i >= 20 && i < 25) {bodyFrameSum = bodyFrameSum + $i;}
					else if (i >= 25 && i < NF) {modsSum = modsSum + $i;}
	};
	print $7, $4, $5, $6, sum, racerSum, engineSum, bodyFrameSum, modsSum, $14, $NF;
} 
END {
}

