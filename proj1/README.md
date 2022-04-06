## proj1

This code parses structured data of CSV format using AWK, a scripting language commonly used to manipulate data and generate reports. 

The scripts rank records based on scores provided in the dataset, and lists the top 3 cars for certain categories.

Data is stored in `data` folder, maintained by git submodule.

The results of this code are sent to three output csv files in the sampleOutputs folder.
One labled initialReport.csv which has all the car data except for the show car in order of ranking.
One labled bestMakes.csv holds the top 3 cars for each make.
The last is topCars.csv which holds the top 3 cars for each of the categories asked.


This code is revised from the original code given.
Bugs were fixed
Functionality was added
New documentation was made.






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

### Run

To run the code you must be in the root directoty and type out
`make p1`

### Flag options
There are 2 flag options available.
The first is for the screen variable which is by default set to 1.
This makes the output also be printed to the screen.
Changing it will stop this.





The second is the numRanks variable which is by default set to 3.
Changing this will change the number of cars displayed for each category.

### Results

The results of this code are sent to three output csv files.
One labled initialReport.csv which has all the car data except for the show car in order of ranking.
One labled bestMakes.csv holds the top 3 cars for each make.
The last is bestCars.csv which holds the top 3 cars for each of the categories asked.


