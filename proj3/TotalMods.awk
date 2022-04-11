BEGIN{FS = ",";OFS=","
	
}
{
	if (NR==1) 
	{}
	else {
		total = 0
		for (i = 25; i <= 33; i++) {
			total = total + $i
		}
		if($7 != "Showcar" || "Vip"){
            print total,$7, $4, $5, $6 > "TotalMods.csv"
		}	
	}

}
END{}
