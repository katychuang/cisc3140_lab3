BEGIN{
  {print "this is the start"}
  FS = ","
  OFS = "\t"
  #ORS = "\n\n "
  #for (i = 1; i <= 20; i++) {
    #cars[i]= $i
  #}
}
{
  ovScore = $11 + $12 + $13 + $14 + $15 + $16 + $17 + $18 + $19 + $20 + $21
  + $22 + $23 + $24 + $25 + $26 + $27 + $28 + $29 + $30 + $31 + $32

  print NR, $4, $6, $8, ovScore
  #print /^14/ $NF
#   arr[0]=$2
#   arr[1]= $3
#   arr[2]=$4
#
#   #print arr[1]
# print "Before Sort: "
# for (i = 0; i <= 3; i++){
#   print arr[i]
# }
#
#  print "After Sort: "
#  for (i = 0; i <= 3; i++){
#   print arr[i]
# }


}

END{
  {print "this is the end"}
}
