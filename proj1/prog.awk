BEGIN{FS=",";
   printf "%-9s %-15s %-9s %-15s %-15s %-15s\n", \
 "Placement", "Total", "CarID", "Year", "Make", "Model" > "proj1/title"
}
{
    if(NR==1){next}            
   else if($7 == "Showcar" || $7 == "Vip"){next}
   else{
          sum=0
           for(i=10;i<=NF;i++)
	   sum= sum + $i
        }
      printf "%-15s %-9s %-15s %-15s %-15s\n", sum, $7, $4, $5, $6 
  }

