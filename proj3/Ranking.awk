BEGIN{FS = ",";OFS=","
	ranking = 1
}
#BODY
{
	print ranking, $0 
	ranking ++
}
END{}
