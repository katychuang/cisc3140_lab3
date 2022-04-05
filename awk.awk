BEGIN{
  print "this is the start"
  FS = ","
  OFS = "\t"
  ORS = "\n "
  rank = 1
  # print " Rank \t record \t car_id"
  # print "---    -------         -------"

}

FNR > 1{
  #Gets all working totals
  modsOverall = $35
  carOveral = $15
  totalRacer = $11 + $12 + $13 + $14
  totalEngine = $16 + $17 + $18 + $19 + $20
  totalBody = $21 + $22 + $23 + $25 + $25
  totalMods = $26 + $27 + $28 + $29 + $30 + $31 + $32 + $33 + $34
  totalScore = $11 + $12 + $13 + $14 + $15 + $16 + $17 + $18 + $19 + $20 + $21
  + $22 + $23 + $24 + $25 + $26 + $27 + $28 + $29 + $30 + $31 + $32


  #Putting totals into separate columns
  $36 = totalBody
  $37 = totalRacer
  $38 = totalMods
  $39 = totalEngine
  $40 = totalScore

  # for (i = 1; i <= 168; i++) {
  #   arr[$36] = $i
  # }

  arr[2]=3
  arr[3]=6
  arr[1]=11
  arr[6]=1

  n = asort(arr, dest)

}

# !/Showcar/{
#
#   print rank, "    "NR,"\t" $8
#   rank++
# }

END{
  print FILENAME "\nNum of Records " NR, "\nthis is the end\n"
}
