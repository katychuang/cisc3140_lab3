#1/bin/awk -f
BEGIN {
FS=","
print "Total","Car_ID","Year","Make","Ranking";
rank=1
}

{
    body_total=0
    for (i=20;i<25;i++) {
        body_total+=$i #add everything from column
    }
    #if(x != $5) {i++}{x = $5}

    if (NR!=1 && $7!="Showcar")  print body_total,$7,$4,$5,"Model",rank++ | "sort -nrk1" #rank will be unsorted, then sorted using terminal commands

}


END {

}
