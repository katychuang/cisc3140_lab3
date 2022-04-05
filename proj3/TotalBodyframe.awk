BEGIN{FS = ",";OFS=","
	
}
{
	if (NR==1) 
	{}
	else {
		total = 0
		for (i = 20; i <= 24; i++) {
			total = total + $i
		}
		if($7 != "Showcar" || "Vip"){
            print total,$7, $4, $5, $6 > "TotalBodyframe.csv"
		}	
	}

}
END{}
