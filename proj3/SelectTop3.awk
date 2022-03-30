BEGIN{FS = ",";OFS=","

}
#BODY
{
	if(NR <=3)
	{
		print $0 
	}
	
}
END{}
