## proj1

This project parses structured data of CSV format using AWK, a scripting language commonly used to manipulate data and generate reports. 

The scripts, described in more detail below, rank records based on scores provided in the dataset, and list the top 3 cars for certain categories.

Data is stored in `data` folder, maintained by git submodule.


### Dependencies 

You must have the following installed. The linux commands to install necessary packages shown below: 

* GNU AWK
  ```sh
  sudo apt-get update
  sudo apt-get install gawk
  ```
* GNU Make
  ```sh
  sudo apt-get install build-essential
  ```
### Project structure

- [1-Racer](1-Racer) contains [script1.awk](1-Racer/script1.awk), [script2.awk](1-Racer/script2.awk), and [script3.awk](1-Racer/script3.awk). 
	- [script1.awk](1-Racer/script1.awk) parses the [input file](../data/data.csv) and prints each Car ID with that car's total racer score to [output1.csv](1-Racer/output1.csv) in descending order of total racer score. The user can use the `y` variable in the [Makefile](../Makefile) to specify cars only from a specific year, or the user can set `y` to _all_ to get cars from all the years. The default value for `y` is _all_.
	- [script2.awk](1-Racer/script2.awk) parses [output1.csv](1-Racer/output1.csv) and prints each Car ID with that car's total racer score and ranking to [output2.csv](1-Racer/output2.csv) in ascending order of ranking.
	- [script3.awk](1-Racer/script3.awk) parses [output2.csv](1-Racer/output2.csv) and prints the top `numRanks` Car IDs, total racer scores, and rankings, where `numRanks` is a variable that the user can set in the [Makefile](../Makefile). The default value for `numRanks` is _3_. 

### Run

To run proj1 make sure you are in the root of the project repository and run `make p1`. 

### Results

Results are stored in a `.txt` document labeled `ranking.txt`, that lists cars by highest points earned to lowest points earned. 

Each entry is ordered by (Car ID, Year, Car Make, Car Model, Total Score).
