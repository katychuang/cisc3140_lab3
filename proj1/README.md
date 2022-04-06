## proj1

This program parses structured data from a CSV format using an AWK script to generate a report. This
report contains the top 3 rankings of Cars in one of several categories. The list is generated in an
descending order that lists the top 3 cars.  



Data is stored in `data` submodule folder and contains information about various aspects of the car
and owner information. This project focuses on only 4 main categories.


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
  ```

### Run

To run proj1 enter root of the project repository and run `make proj1`. 

### Results

Results are outputed to  document labeled `tmp`, and is then outputted to the screen. 

Each entry is in order by (Total Score, CarID, Year, Make, Model).
