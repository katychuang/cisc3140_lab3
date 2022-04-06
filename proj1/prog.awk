BEGIN{FS=",";}

{
  if(NR==1){
          printf("%-15s%-9s%-15s%-15s%-15s\n", $7,$4,$5,$6,"Total" > title )  
   }else if($7 == "Showcar" && $7 == "Vip"){false}
   else{
          sum=0
     for(i=10;i<=NF;i++)
	 sum= sum + $i
        }
      printf "%-15s%-9s%-15s%-15s%-15s\n", $7, $4, $5, $6, sum  
    }

