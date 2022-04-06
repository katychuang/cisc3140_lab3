#1/bin/awk -f
#top modsoverall cars
BEGIN {
    FS=","
    print "Mods_Overall_Total","Car_ID","Year","Make","Model--Ranking";
    rank=1
}
{
    mods_overall = $34 #get data from the last column

    if (NR!=1 && $7 != "Showcar") print mods_overall,$7,$4,$5,"Model",rank++  | "sort -nrk1" #rank will be unsorted, then sorted using termianl commands
}

END{

}
