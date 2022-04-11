BEGIN{FS = ",";OFS=","
	
}
{
	if (NR==1) 
	{}
	else {
		total = 0
		for (i = 15; i <= 19; i++) {
			total = total + $i
		}
		if($7 != "Showcar" || "Vip"){
            print total,$7, $4, $5, $6 > "TotalEngine.csv"
		}	
	}

}
END{}
