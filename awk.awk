BEGIN{
  print "this is the start"
  FS = ","
  OFS = "\t"
  ORS = "\n "
  rank = 1
  }
  # print " Rank \t record \t car_id"
  # print "---    -------         -------"

}

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

  #Puts each value of the total scores into an array
  b = split($36, body)
  r = split($37, racer)
  m = split($38, mods)
  e = split($39, engine)
  ovmod = split($35, modov)
  ovcar = split($15, carov)
  #Uses sort function to rank scores
  arr = sort(body)
  arr1 = sort(racer)
  arr2 = sort(mods)
  arr3 = sort(engine)
  arr4 = sort(modov)
  arr5 = sort(carov)
}

/Acura/{
  ac = split($40, acu)
  acura = sort(acu)
}

/Audi/{
  au = split($40, aud)
  audi = sort(aud)
}
/Bmw/{
  bb = split($40, bm)
  bmw = sort(bm)
}
/Chevy/{
  che = split($40, chev)
  chevy = sort(chev)
}
/Chrystler/{
  chr = split($40, chry)
  chryst = sort(chry)
}
/Dodge/{
  dod = split($40, dodg)
  dodge = sort(dodg)
}
/Ford/{
  ff = split($40, fo)
  ford = sort(fo)
}
/Honda/{
  ho = split($40, hon)
  honda = sort(hon)
}
/Hyundai/{
  hy = split($40, hyu)
  hyundai = sort(hyu)
}
/Infiniti/{
  inf = split($40, infi)
  infiniti = sort(infi)
}
/Jeep/{
  je = split($40, jee)
  jeep = sort(jee)
}
/Lexus/{
  le = split($40, lex)
  lexus = sort(lex)
}
/Mazda/{
  ma = split($40, maz)
  mazda = sort(maz)
}
/Mercedes/{
  me = split($40, mer)
  mercedes = sort(mer)
}
/Mitsu/{
  mi = split($40, mit)
  mitsu = sort(mit)
}
/Nissan/{
  ni = split($40, nis)
  nissan = sort(nis)
}
/Scion/{
  sc = split($40, sci)
  scion = sort(sci)
}
/Subaru/{
  su = split($40, suba)
  subaru = sort(suba)
}
/Toyota/{
  toy = split($40, toyo)
  toyota = sort(toyo)
}
/Volkswagen/{
  vo = split($40, volk)
  volks = sort(volk)
}
/Volvo/{
  v = split($40, volv)
  volvo = sort(volv)
}
END && !/Showcar/{
    #prints top 3 cars
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, arr[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 racers
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, arr1[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 mods
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, arr2[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 engine
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, arr3[i]
      rank++
    }

    rank = 1  #resets ranks

    #prints top 3 modsOverall
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, arr4[i]
      rank++
    }

    rank = 1  #resets ranks

    #prints top 3 carOveral
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, arr5[i]
      rank++
    }

    rank = 1  #resets ranks

    #prints top 3 acura
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, acura[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 audi
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, audi[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 bmw
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, bmw[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 chevy
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, chevy[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 Chrystler
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, chryst[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 dodge
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, dodge[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 ford
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, ford[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 honda
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, honda[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 hyundai
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, hyundai[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 infiniti
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, infiniti[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 jeep
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, jeep[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 lexus
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, lexus[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 mazda
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, mazda[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 mercedes
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, mercedes[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 mitsu
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, mitsu[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 nissan
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, nissan[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 scion
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, scion[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 subaru
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, subaru[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 toyota
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, toyota[i]
      rank++
    }

    rank = 1  #resets rank variable

    #prints top 3 Volkswagen
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, volks[i]
      rank++
    }

    #prints top 3 volvo
    for (i =1; i <= 3; i++) {
      print rank, $8, $5, $6, volvo[i]
      rank++
    }

    rank = 1  #resets rank variable

    rank = 1  #resets rank variable
    print "This is the end"
}

function sort(arr) {
    for (i = 1; i > length(arr); i++) {
      if (arr[i] < arr[i++]) {
        temp = arr[i]
        arr[i] = arr[i++]
        arr[i]= temp
      }
    }
    return arr
}
