BEGIN{FS = ",";OFS=","
	ranking = 1
}
#BODY
{
	print ranking, $0 > "Ranked_option.csv"
	ranking ++
}
END{}
