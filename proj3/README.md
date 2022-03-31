# proj3


## Description

This project parses an input file and executes various awk scripts to provide a list of the top three cars overall, a list of the top three cars for each make, and a list of the top numRanks cars for the total racer scores, the total engine scores, the total body frame scores, the total mods scores, the mods overall scores, and the car overall scores.

**Files and Directory:**

```.
├── 1-Racer
│   ├── output1.csv
│   ├── output2.csv
│   ├── output3.csv
│   ├── script1.awk
│   ├── script2.awk
│   └── script3.awk
├── 2-Engine
│   ├── output4.csv
│   ├── output5.csv
│   ├── output6.csv
│   ├── script4.awk
│   ├── script5.awk
│   └── script6.awk
├── 3-Body_Frame
│   ├── output7.csv
│   ├── output8.csv
│   ├── output9.csv
│   ├── script7.awk
│   ├── script8.awk
│   └── script9.awk
├── 4-Mods
│   ├── output10.csv
│   ├── output11.csv
│   ├── output12.csv
│   ├── script10.awk
│   ├── script11.awk
│   └── script12.awk
├── 5-Mods_Overall
│   ├── output13.csv
│   ├── output14.csv
│   ├── output15.csv
│   ├── script13.awk
│   ├── script14.awk
│   └── script15.awk
├── 6-Car_Overall
│   ├── output16.csv
│   ├── output17.csv
│   ├── output18.csv
│   ├── script16.awk
│   ├── script17.awk
│   └── script18.awk
├── headers
├── prog1.awk
├── prog2.awk
├── ranks
├── README.md
├── sorted_ranks
└── top_3
```

## Executing program

Run `make p3` from root directory.


## Project structure

- [prog1.awk](prog1.awk) and [prog2.awk](prog2.awk) produce [ranks](ranks) which contains information on each car and its rank based on its total score, [sorted_ranks](sorted_ranks) which contains information on each car and its rank based on its total score, and [top_3](top_3) which contains information on the top 3 cars for each make. 

- [1-Racer](1-Racer) contains [script1.awk](1-Racer/script1.awk), [script2.awk](1-Racer/script2.awk), and [script3.awk](1-Racer/script3.awk). 
	- [script1.awk](1-Racer/script1.awk) parses the and prints each Car ID with that car's total racer score to [output1.csv](1-Racer/output1.csv) in descending order of total racer score. The user can use the `y` variable in the [Makefile](../Makefile) to specify cars only from a specific year, or the user can set `y` to _all_ to get cars from all the years. The default value for `y` is _all_.
	- [script2.awk](1-Racer/script2.awk) parses [output1.csv](1-Racer/output1.csv) and prints each Car ID with that car's total racer score and ranking to [output2.csv](1-Racer/output2.csv) in ascending order of ranking.
	- [script3.awk](1-Racer/script3.awk) parses [output2.csv](1-Racer/output2.csv) and prints the top `numRanks` Car IDs, total racer scores, and rankings to [output3.csv](1-Racer/output3.csv), where `numRanks` is a variable that the user can set in the [Makefile](../Makefile). The default value for `numRanks` is _3_. 
 
- [2-Engine](2-Engine) contains [script4.awk](2-Engine/script4.awk), [script5.awk](2-Engine/script5.awk), and [script6.awk](2-Engine/script6.awk). 
	- [script4.awk](2-Engine/script4.awk) parses the and prints each Car ID with that car's total racer score to [output4.csv](2-Engine/output4.csv) in descending order of total racer score. The user can use the `y` variable in the [Makefile](../Makefile) to specify cars only from a specific year, or the user can set `y` to _all_ to get cars from all the years. The default value for `y` is _all_.
	- [script5.awk](2-Engine/script5.awk) parses [output4.csv](2-Engine/output4.csv) and prints each Car ID with that car's total racer score and ranking to [output5.csv](2-Engine/output5.csv) in ascending order of ranking.
	- [script6.awk](2-Engine/script6.awk) parses [output5.csv](2-Engine/output5.csv) and prints the top `numRanks` Car IDs, total racer scores, and rankings to [output6.csv](2-Engine/output6.csv), where `numRanks` is a variable that the user can set in the [Makefile](../Makefile). The default value for `numRanks` is _3_. 

- [3-Body_Frame](3-Body_Frame) contains [script7.awk](3-Body_Frame/script7.awk), [script8.awk](3-Body_Frame/script8.awk), and [script9.awk](3-Body_Frame/script9.awk). 
	- [script7.awk](3-Body_Frame/script7.awk) parses the and prints each Car ID with that car's total racer score to [output7.csv](3-Body_Frame/output7.csv) in descending order of total racer score. The user can use the `y` variable in the [Makefile](../Makefile) to specify cars only from a specific year, or the user can set `y` to _all_ to get cars from all the years. The default value for `y` is _all_.
	- [script8.awk](3-Body_Frame/script8.awk) parses [output7.csv](3-Body_Frame/output7.csv) and prints each Car ID with that car's total racer score and ranking to [output8.csv](3-Body_Frame/output8.csv) in ascending order of ranking.
	- [script9.awk](3-Body_Frame/script9.awk) parses [output8.csv](3-Body_Frame/output8.csv) and prints the top `numRanks` Car IDs, total racer scores, and rankings to [output9.csv](3-Body_Frame/output9.csv), where `numRanks` is a variable that the user can set in the [Makefile](../Makefile). The default value for `numRanks` is _3_. 

- [4-Mods](4-Mods) contains [script10.awk](4-Mods/script10.awk), [script11.awk](4-Mods/script11.awk), and [script12.awk](4-Mods/script12.awk). 
	- [script10.awk](4-Mods/script10.awk) parses the and prints each Car ID with that car's total racer score to [output10.csv](4-Mods/output10.csv) in descending order of total racer score. The user can use the `y` variable in the [Makefile](../Makefile) to specify cars only from a specific year, or the user can set `y` to _all_ to get cars from all the years. The default value for `y` is _all_.
	- [script11.awk](4-Mods/script11.awk) parses [output10.csv](4-Mods/output10.csv) and prints each Car ID with that car's total racer score and ranking to [output11.csv](4-Mods/output11.csv) in ascending order of ranking.
	- [script12.awk](4-Mods/script12.awk) parses [output11.csv](4-Mods/output11.csv) and prints the top `numRanks` Car IDs, total racer scores, and rankings to [output12/csv](4-Mods/output12.csv), where `numRanks` is a variable that the user can set in the [Makefile](../Makefile). The default value for `numRanks` is _3_. 

- [5-Mods_Overall](5-Mods_Overall) contains [script13.awk](5-Mods_Overall/script13.awk), [script14.awk](5-Mods_Overall/script14.awk), and [script15.awk](5-Mods_Overall/script15.awk). 
	- [script13.awk](5-Mods_Overall/script13.awk) parses the and prints each Car ID with that car's total racer score to [output13.csv](5-Mods_Overall/output13.csv) in descending order of total racer score. The user can use the `y` variable in the [Makefile](../Makefile) to specify cars only from a specific year, or the user can set `y` to _all_ to get cars from all the years. The default value for `y` is _all_.
	- [script14.awk](5-Mods_Overall/script14.awk) parses [output13.csv](5-Mods_Overall/output13.csv) and prints each Car ID with that car's total racer score and ranking to [output14.csv](5-Mods_Overall/output14.csv) in ascending order of ranking.
	- [script15.awk](5-Mods_Overall/script15.awk) parses [output14.csv](5-Mods_Overall/output14.csv) and prints the top `numRanks` Car IDs, total racer scores, and rankings to [output15.csv](5-Mods_Overall/output15.csv), where `numRanks` is a variable that the user can set in the [Makefile](../Makefile). The default value for `numRanks` is _3_. 

- [6-Car_Overall](6-Car_Overall) contains [script16.awk](6-Car_Overall/script16.awk), [script17.awk](6-Car_Overall/script17.awk), and [script18.awk](6-Car_Overall/script18.awk). 
	- [script16.awk](6-Car_Overall/script16.awk) parses the and prints each Car ID with that car's total racer score to [output16.csv](6-Car_Overall/output16.csv) in descending order of total racer score. The user can use the `y` variable in the [Makefile](../Makefile) to specify cars only from a specific year, or the user can set `y` to _all_ to get cars from all the years. The default value for `y` is _all_.
	- [script17.awk](6-Car_Overall/script17.awk) parses [output16.csv](6-Car_Overall/output16.csv) and prints each Car ID with that car's total racer score and ranking to [output17.csv](6-Car_Overall/output17.csv) in ascending order of ranking.
	- [script18.awk](6-Car_Overall/script18.awk) parses [output17.csv](6-Car_Overall/output17.csv) and prints the top `numRanks` Car IDs, total racer scores, and rankings to [output18.csv](6-Car_Overall/output18.csv), where `numRanks` is a variable that the user can set in the [Makefile](../Makefile). The default value for `numRanks` is _3_. 

- [headers](headers) contains the headers used in [sorted_ranks](sorted_ranks) and in [top_3](top_3). 

## Dependencies

GNU Awk and GNU Make must be installed.

