BEGIN{FS=",";
   printf "%-6s %-6s %-6s %-6s %-12s %-12s\n", \
 "Place", "Total", "CarID", "Year", "Make", "Model" > "proj1/title"
}
{
    if(NR==1){next}            
   else if($7 == "Showcar" || $7 == "Vip"){next}
   else{
          sum=0
           for(i=10;i<=NF;i++)
	   sum= sum + $i
        }
      printf "%-6s %-6s %-6s %-6s %-12s %-12s\n", "tmp", sum, $7, $4, $5, $6 
  }

