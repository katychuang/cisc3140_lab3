BEGIN{
    FS = ","
    OFS = ","
}
{
    #Shifting all columns by 1 and setting the first column as Ranking
    for (i = NF; i >= 1; --i)
		$(i+1) = $i;
	$1 = NR; 
	print $0; 
}
END{

}