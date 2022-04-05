BEGIN{FS=",";}
{
  if(NR==1) printf("%-15s%-9s%-15s%-15s%-15s", $7,$4,$5,$6,"Total")
  else if($7 == "Showcar"){
	false}
	else{
  sum=0
  for(i=8;i<=NF;i++) sum+= $i
  printf "%-15s%-9s%-15s%-15s%-15s", total
  }
}
