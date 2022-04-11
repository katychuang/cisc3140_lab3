BEGIN{
FS=","
}
{
# sort alphabetically order use column 4 (make)
if (NR!=1) 
   print|"sort -k4,4 -s"
}
END{
}
