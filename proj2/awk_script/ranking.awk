BEGIN{
FS=","
print "Total","Car_ID","Year","Make","Model","Ranking";
}
{
if (NR!=1) 
   print $1,$2,$3,$4,$5,NR-1
}

END{

}
