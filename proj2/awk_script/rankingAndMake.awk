BEGIN{
FS=","
}
{
if (NR!=1) 
   print|"sort -k4,4 -s"
}
END{
}
