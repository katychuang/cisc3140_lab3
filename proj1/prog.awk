BEGIN{FS=",";}
   printf("%-15s%-9s%-15s%-15s%-15s\n", $7,$4,$5,$6, \
  "Total",  "CarID", "Make", "Model", "Year", > "title" 
}
{
    if(NR==1){next}            
   }else if($7 == "Showcar" || $7 == "Vip"){next}
   else{
          sum=0
         for(i=10;i<=NF;i++)
	   sum= sum + $i
        }
      printf "%-15s%-9s%-15s%-15s%-15s\n", sum, $7, $4, $5, $6, 
    }

