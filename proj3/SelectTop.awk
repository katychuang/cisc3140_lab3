BEGIN{FS = ",";OFS=","
	
	print "Top _ cars for rank result"
	getline top < "-"
	print "Ranking,score,CarId,year,make,model"
}
#BODY
{
	if(NR <= top)
	{
		print $0 > "result.csv"
	}
	
}
END{}
