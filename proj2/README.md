# proj2

## Description

This project parses an input file and executes various awk scripts to provide a list of the top three cars overall, a list of the top three cars for each make, and a list of the top `numRanks` cars for the total racer scores, the total engine scores, the total body frame scores, the total mods scores, the mods overall scores, and the car overall scores.

## Executing program

1. Copy data to local machine. The repo contains a single file named `data.csv`

```sh
git submodule add -f https://gist.github.com/d66a59b6db4e59c16efd4c42ad411f8e.git data
```

2. Data analysis 
	a. Run `make p2` from the root of the project repository which prints the Total, Car ID, year, make, model, and ranking header, copies all the Car IDs, years, makes, and models from the data file to the output file, fills in the total column using the cars' scores, and prints the results in descending order of total. 
	b. Run `paste -d' ' <(cut -d' ' -f1-5 report.csv )  <(cut -d' ' -f6- report.csv |sort -n) >sortedreport.csv` to sort the rankings in numeric order and print to [sortedreport.csv](sortedreport.csv).

### Known bugs

- Data from the input file that contains a whitespace character is read into two different columns. For example, if make is "Hello world", "Hello" is read into column n and "world" is read into column n+1. 
	- Temp fix: All models names are replaced with the word "Model".

- The string "Ranking" would get sorted along with the values in the Ranking column, rather than remaining as the header. 
	- Temp fix: Attached "--Ranking" to the same column as Model.

- Now, to create a new script that will search for unique name (by adding total string value we can get an unique ID)
For each make with a unique name, print top three. Total is already sorted, so the program just needs to
print the first three cars that matched the name. (Using a counter=0, when counter=3 move on next unique name. Use next;)

`touch topCarMakes.awk`

Looks at column 1. Takes carmake and set as string(To use for comparison later)
Prints ranking, car_id, year, car make, car model, total score to new File.
Counter++; // This counter will move on to next car make on 3.

Now "skip" all car makes with the unique ID and restart until there is no more data in the .CSV.


## Project structure

- [prog.awk](prog.awk) copies all the Car IDs, years, makes, and models from the data file to the output file, fills in the total column using the cars' scores, and prints the results in descending order of total.

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

## Dependencies

GNU Awk and GNU Make must be installed


