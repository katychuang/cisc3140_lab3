BEGIN{
  print "this is the start"
  FS = ","
  OFS = "\t"
  ORS = "\n "
  rank = 1
  for (i =1; i <= FNR; i++) {
    arr[$i]=$8
  }
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

  n = split($36, array)

  # for (i = 1; i <= n; i++) {
  #   print array[i]
  # }

  w = asort(array, dest)
  for (i = 1; i <= n; i++) {
    print dest[i], array[i]
  }

  # asort(array, dest)
  # l = length(dest)
  # for (i = 1; i <= l; i++) {
  #   print dest[i], array[i]
  # }
  #Sorting the array
  #n = asort(arr, dest)
}

#To check each Make of cars
$6 && !/Showcar/ && FNR > 1{

}



# !/Showcar/{
#
#   print rank, "    "NR,"\t" $8
#   rank++
# }

END{

   print "Num of Records " NR, "\n this is the end\n"

}
