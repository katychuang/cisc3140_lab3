## proj1

This project parses structured data of CSV format using AWK, a scripting language commonly used to manipulate data and generate reports. 

The scripts rank records based on scores provided in the dataset, and lists the top 3 cars for certain categories.

The data used for this project is stored in the `data` folder, found in the root directory of this repo. The data is maintained as a git submodule.

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

The provided scripts have been tested to work on a Linux machine, to ensure similar results to our tests, please run the scripts in a Linux environment.

To run the project scripts make sure you are in the root of the project repository and run `make p1` in the terminal/CLI. 

### Results

Results are stored in a `.txt` document labeled `ranking.txt`, that lists cars by highest points earned to lowest points earned. 

Each entry is ordered by (Car ID, Year, Car Make, Car Model, Total Score).
