BEGIN{FS = ",";OFS=","
	print "Car_ID" "|" "Year" "|" "Make" "|" "Model" "|" "Ranks" > "headers"
}
#BODY
{
	if (NR==1) 
	{}
	else {
		total = 0
		for (i = 10; i < 14; ++i) {
			total = total + $i
		}
		if($7 != "Showcar"){

                	print total,$7, $4, $5, $6 > "TotalRacer.csv"
		}	
	}

}
END{}
