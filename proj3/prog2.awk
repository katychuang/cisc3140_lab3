BEGIN{FS = "|"}
#BODY
{
	if ($3==$prev) {
		print $1 "|" $2 "|" $3 "|" $4 "|" $5 > "top_3"
	} 
}
END{}
