## proj1

This program parses structured data from a CSV format using an AWK script to generate a report. This
report contains the top 3 rankings of Cars in one of several categories. The list is generated in an
descending order that lists the top 3 cars. This program also incorporates the newest features which lists the top rankings for the
newest class editions such Racer, Engine, Car Overall, etc..  



Data is stored in `data` submodule folder and contains information about various aspects of the car
and owner information. This project focuses on only 4 main categories for the first part and the new editions
feature six different awk programs for each of them that will list out the rankings for each of the new categories.
These will be sorted and outputted in a proper formatted manner according to the criteria of what is selected to rank
them on.



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
* Installation & Requirements
  ```sh
  Must be on a Linux System
  AWK scripting language must be installed
  data.csv must be available in the submodule data
  Six Awk scripts should be present and accounted for the newest features 
  before running the program.

### Run

To run proj1 enter root of the project repository and run `make proj1`. 

### Results

Results are outputed to  document labeled `tmp`, and is then outputted to the screen. 

Each entry is in order by (Total Score, CarID, Year, Make, Model). After that you will see
the new features and their rankings for onlt the top 3 cars. They will print one after another
in desceding order by (Car Overall, Engine, Racer, Body Frame, Mods, Mods Overall).




