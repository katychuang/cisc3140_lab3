BEGIN{
  PROCINFO["sorted_in"] = "@ind_num_asc"
  print "this is the start"
  FS = ","
  OFS = "\t"
  ORS = "\n "
  rank = 1
  }

  # FNR == 1{
  #    print "RANKING" OFS $7 OFS $5 OFS $4 OFS $6 OFS "SCORE"
  # }

#Skips first row and ignores Showcar
FNR > 1 && !/Showcar/{
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

  #Fills array ARRAY with values in each field & sort
  total[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(totals)

  body[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $36
  asort(body)

  racer[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $37
  asort(racer)

  mod[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $38
  asort(mods)

  engine[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $39
  asort(engine)


  #Puts each value of the total scores into an array
  # b = split($36, body)
  # r = split($37, racer)
  # m = split($38, mods)
  # e = split($39, engine)
  # ovmod = split($35, modov)
  # ovcar = split($15, carov)


  #Uses sort function to rank scores
  # arr = asort(body)
  # arr1 = asort(racer)
  # arr2 = asort(mods)
  # arr3 = asort(engine)
  # arr4 = asort(modov)
  # arr5 = asort(carov)
}
/Acura/{
  acura[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(acura)
}


/Audi/{
  audi[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(audi)
}
/Bmw/{
  bmw[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(bmw)
}
/Chevy/{
  chevy[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(chevy)
}
/Chrystler/{
  chrystler[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(chrystler)
}
/Dodge/{
  dodge[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(dodge)
}
/Ford/{
  ford[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(ford)
}
/Honda/{
  honda[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(honda)
}
/Hyundai/{
  hyundai[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(hyundai)
}
/Infiniti/{
  infiniti[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(infiniti)
}
/Jeep/{
  jeep[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(jeep)
}
/Lexus/{
  lexus[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(lexus)
}
/Mazda/{
  mazda[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(mazda)
}
/Mercedes/{
  mercedes[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(mercedes)
}
/Mitsu/{
  mitsu[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(mitsu)
}
/Nissan/{
  nissan[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(nissan)
}
/Scion/{
  scion[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(scion)
}
/Subaru/{
  subaru[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(subaru)
}
/Toyota/{
  toyota[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(toyota)
}
/Volkswagen/{
  volks[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(volks)
}
/Volvo/{
  volvo[FNR] = $7 OFS $4 OFS $5 OFS $6 OFS $40;
  asort(volvo)
}


END{
  print "Top cars"
  #Gets the top 3
  for (i = 1; i <= 3; i++) {
    totals[i] = total[i]
  }
  #prints top 3
  for (i in totals){
    print  rank, totals[i];
    rank++
 }
 #resets rank
 rank = 1
 print "\nTop engines"

  #Gets the top 3
  for (i = 1; i <= 3; i++) {
    engines[i] = engine[i]
  }
  #prints top 3
  for (i in engines){
    print  rank, engines[i];
    rank++
 }
 #resets rank
 rank = 1
 print "\nTop racers"
 #Gets the top 3
 for (i = 1; i <= 3; i++) {
   racers[i] = racer[i]
 }
 #prints top 3
 for (i in racers){
   print rank, racers[i];
   rank++
}

#resets rank
rank = 1
print "\nTop mods"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  mods[i] = mod[i]
}
#prints top 3
for (i in mods){
  print rank, mods[i];
  rank++
}

#resets rank
rank = 1
print "\nTop body"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  bodys[i] = body[i]
}
#prints top 3
for (i in bodys){
  print rank, bodys[i];
  rank++
}

#resets rank
rank = 1
print "\nTop acura"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  acuras[i] = acura[i]
}
#prints top 3
for (i in acuras){
  print rank, acuras[i];
  rank++
}

#resets rank
rank = 1
print "\nTop audi"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  audis[i] = audi[i]
}
#prints top 3
for (i in audis){
  print rank, audis[i];
  rank++
}

#resets rank
rank = 1
print "\nTop bmw"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  bmws[i] = bmw[i]
}
#prints top 3
for (i in bmws){
  print rank, bmws[i];
  rank++
}

#resets rank
rank = 1
print "\nTop chevy"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  chevys[i] = chevy[i]
}
#prints top 3
for (i in chevys){
  print rank, chevys[i];
  rank++
}
#resets rank
rank=1
print "\nTop chrystler"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  chrystlers[i] = chrystler[i]
}
#prints top 3
for (i in chrystlers){
  print rank, chrystlers[i];
  rank++
}

#resets rank
rank = 1
print "\nTop dodge"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  dodges[i] = dodge[i]
}
#prints top 3
for (i in dodges){
  print rank, dodges[i];
  rank++
}

#resets rank
rank = 1
print "\nTop ford"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  fords[i] = ford[i]
}
#prints top 3
for (i in fords){
  print rank, fords[i];
  rank++
}

#resets rank
rank = 1
print "\nTop honda"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  hondas[i] = honda[i]
}
#prints top 3
for (i in hondas){
  print rank, hondas[i];
  rank++
}

#resets rank
rank = 1
print "\nTop hyundai"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  hyundais[i] = hyundai[i]
}
#prints top 3
for (i in hyundais){
  print rank, hyundais[i];
  rank++
}

#resets rank
rank = 1
print "\nTop infiniti"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  infinitis[i] = infiniti[i]
}
#prints top 3
for (i in infinitis){
  print rank, infinitis[i];
  rank++
}

#resets rank
rank = 1
print "\nTop jeep"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  jeeps[i] = jeep[i]
}
#prints top 3
for (i in jeeps){
  print rank, jeeps[i];
  rank++
}

#resets rank
rank = 1
print "\nTop lexus"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  lexuss[i] = lexus[i]
}
#prints top 3
for (i in lexuss){
  print rank, lexuss[i];
  rank++
}

#resets rank
rank = 1
print "\nTop mazda"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  mazdas[i] = mazda[i]
}
#prints top 3
for (i in mazdas){
  print rank, mazdas[i];
  rank++
}

#resets rank
rank = 1
print "\nTop mercedes"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  mercedess[i] = mercedes[i]
}
#prints top 3
for (i in mercedess){
  print rank, mercedess[i];
  rank++
}

#resets rank
rank = 1
print "\nTop mitsu"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  mitsus[i] = mitsu[i]
}
#prints top 3
for (i in mitsus){
  print rank, mitsus[i];
  rank++
}

#resets rank
rank = 1
print "\nTop nissan"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  nissans[i] = nissan[i]
}
#prints top 3
for (i in nissans){
  print rank, nissans[i];
  rank++
}

#resets rank
rank = 1
print "\nTop scion"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  scions[i] = scion[i]
}
#prints top 3
for (i in scions){
  print rank, scions[i];
  rank++
}

#resets rank
rank = 1
print "\nTop subaru"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  subarus[i] = subaru[i]
}
#prints top 3
for (i in subarus){
  print rank, subarus[i];
  rank++
}

#resets rank
rank = 1
print "\nTop toyota"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  toyotas[i] = toyota[i]
}
#prints top 3
for (i in toyotas){
  print rank, toyotas[i];
  rank++
}

#resets rank
rank = 1
print "\nTop Volkswagen"
#Gets the top 3
for (i = 1; i <= 3; i++) {
  volkss[i] = volks[i]
}
#prints top 3
for (i in volkss){
  print rank, volkss[i];
  rank++
}

#resets rank
rank = 1
print "\nTop volvo"

#Gets the top 3
for (i = 1; i <= 3; i++) {
  volvos[i] = volvo[i]
}
#prints top 3
for (i in volvos){
  print rank, volvos[i];
  rank++
}

#resets rank
rank = 1
print "\n"
}
function sort(arr) {

    for (i = 1; i > length(arr); i++) {
      if (arr[i] < arr[i++]) {
        temp = arr[i]
        arr[i] = arr[i++]
        arr[i]= temp
      }
    }
}
