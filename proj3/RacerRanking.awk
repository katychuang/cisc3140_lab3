BEGIN{FS = ",";OFS=","
	ranking = 1
}
#BODY
{
	print ranking, $0 > "RacerRank.csv"
	ranking ++
}
END{}
