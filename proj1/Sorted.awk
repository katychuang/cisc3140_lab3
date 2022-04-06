BEGIN{
	cnt = 1;
}

{
	 printf "%-6s &-6s %-6s %-6s %-12s %-12s\n", \
	 cnt, $2, $3, $4, $5, $6;
         cnt++;
}
END{
}
