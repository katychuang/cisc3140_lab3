# Project 2
This project parses structured data from a CSV file using GNU AWK, a scripting language commonly used to manipulate data and generate reports.

The GNU AWK scripts rank records of vehicles based on score values found in the dataset, and lists the top three cars across various categories.

This project explores the second iteration of the overall project objectives which can be found/read in the main **[README file](https://github.com/ogre2/cisc3140_lab3/blob/main/README.md)** document, located in the root of this repository. In this iteration, the primary output contains both the unsorted and sorted results, this will be discussed further in the results section of this document.

Our revisions for this project attempted to continue off the base that was established from the original code. We tried to maintain similar naming conventions throughout, and interpret how the project could've continued.

## Files and directory structure
```
cisc3140_lab3/proj2/
|-- awk/
    |-- prog.awk
    |-- sort.awk
    |-- classes.awk
|-- output/
    |-- output.csv
    |-- classes.csv
|-- README.md
```

## Prerequisites
Before you begin, ensure that you have met the following requirements:
- You have **Git v1.8.3.1** and above installed in your machine.
- You have have **GNU AWK v4.0.2** and above installed in your machine.
- You are running the project in a **Linux machine/environment**. This project is currently **only tested for Linux machines**.
- You have read the main repo **[README file](https://github.com/ogre2/cisc3140_lab3/blob/main/README.md)**, located in the root of this repository.

## Running the project
To run the project scripts, follow these steps:
```
    cd cisc3140_lab3/

    make p2
```

When the GNU Make command is ran, you will be prompted with these messages in the terminal/CLI indicating that scripts have successfully executed and compiled our results.
```
Running AWK Program script proj2:
awk -f proj2/awk/program.awk data/data.csv > proj2/output/output.csv
```

## Results
Results will be stored as a .csv file within the project output directory which you can navigate to by running this command once you're inside the
main project directory.
```
cd proj2/output/
```

## Explaining results
Below, we will define the results of the data found in the output folder.

## Known bugs
Current bugs that we're trying to fix are:
- Grouping the sorted output into threes, and ranking from each group results from 1 to 3 (top to bottom)

## Contributors
Thanks to the following peple who have contributed to this project:
- [@ogre2](https://github.com/ogre2/)
- [@kyong4](https://github.com/kyong4/)
- [@tianye-chen](https://github.com/tianye-chen/)
- [@bohuinong](https://github.com/bohuinong)
- [@ayingtao11](https://github.com/ayingtao11)
- [@shua14](https://github.com/shua14)
