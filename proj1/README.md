
## proj1

This project parses structured data of CSV format using AWK, a scripting language commonly used to manipulate data and generate reports.

The scripts rank records based on scores provided in the dataset, and lists the top 3 cars for certain categories.

MakeFile was created  where the user option was implemented.

Data is stored in `data` folder, maintained by git submodule which is then used in the MakeFile.


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

To run proj1 make sure you are in the proper repository and run `make_(Insert User Option)`.

List of possible commands:

	make rankedOverall
	make racer
	make engine 
	make bodyFrame
	make mods
	make carOverall
	make modsOverall
	make topThree

### Results
info.csv sorts through the data and gets removed at the end of each user option.

**[output.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/output.csv)** sorts and ranks the data.

**[RankBodyFrame.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/RankBodyFrame.csv)** outputs the cars ranked by Body Frames.

**[RankCarOverall.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/RankCarOverall.csv)** outputs the cars ranked by Highest Overall Car.

**[RankEngine.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/RankEngine.csv)** outputs the cars ranked by Engine.

**[RankMods.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/RankMods.csv)** outputs the cars ranked by Mods.

**[RankModsOverall.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/RankModsOverall.csv)** outputs the cars ranked by the Mods Overall.

**[RankRacer.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/RankRacer.csv)** outputs the cars ranked by the Racer.

**[TopThree.csv](https://github.com/steven-yanh/cisc3140_lab3/blob/main/proj1/Sample_outputs/TopThree.csv)** outs the top 3 total cars of each make.
