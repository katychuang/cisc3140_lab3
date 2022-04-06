# Project 1
This project parses structured data from a CSV file using GNU AWK, a scripting language commonly used to manipulate data and generate reports.

The GNU AWK scripts rank records of vehicles based on score values found in the dataset, and lists the top three cars across various categories.

This project explores the first iteration of the overall project objectives which can be found/read in the main **[README file](https://github.com/ogre2/cisc3140_lab3/blob/main/README.md)** document, located in the root of this repository.

Our revisions for this project attempted to continue off the base that was established from the original code. We tried to maintain similar naming conventions throughout, and interpret how the project could've continued.

## Files and directory structure
```
.
|-- awk/
    |-- prog.awk
    |-- sort.awk
    |-- classes.awk
|-- output/
    |-- output.csv
    |-- sorted.csv
    |-- classes.csv
|-- README.md
```

## Prerequisites
Before you begin, ensure that you have met the following requirements:
- You have **Git v1.8.3.1** and above installed in your machine.
- You have have **GNU AWK v4.0.2** and above installed in your machine.
- You are running the project in a **Linux machine/environment**. This project is currently **only tested for Linux machines**.
- You have read the main repo **[README file](https://github.com/ogre2/cisc3140_lab3/blob/main/README.md)**, located in the root of this repository.

## Installing
To install the project, follow these steps:
```
git clone https://github.com/ogre2/cisc3140_lab3
```

## Running the project
To run the project scripts, follow these steps:
```
    cd cisc3140_lab3/

    make p1
```

When the GNU Make command is ran, you will be prompted with these messages in the terminal/CLI indicating that scripts have successfully executed and compiled our results.
```
Running AWK Program script proj1:
awk -f proj1/awk/prog.awk data/data.csv > proj1/output/output.csv
Running AWK Sort script proj1:
awk -f proj1/awk/sort.awk proj1/output/output.csv > proj1/output.sorted.csv
Running AWK Classes script proj1:
awk -f proj1/awk/classes.awk data/data.csv > proj1/output/classes.csv
```

## Results
Results will be stored as a .csv file within the project output directory which you can navigate to by running this command once you're inside the
main project directory.
```
cd proj1/output/
```

## Explaining results
Below, we will define the results of the data found in the output folder.

- The **output.csv**, is the primary resulting output from parsing the input dataset. The **prog.awk** script sifts through the input data and grabs several columns found within <br>the dataset including but not limited to: Car_ID, Year, Make, and Model. These are printed directly into the **output.csv** file without manipulation or changes. An additional two columns are created, one titled Ranking, and the other Total. Ranking will precede the aforementioned columns, whilst Total will succeed them. The ranking column will display a numerical value to signify where the vehicle ranks in the overall dataset based on the sum of the values from the judged categories now identified by the calculated total.
- When combing through the data, the **prog.awk** will scan each vehicle row, and it will tally up the scores earned in each judge category to calculate a total. <br> These categories start from column 10 to column 34. The total is then printed along side the aforementioned fields like so:
```
Ranking	Car_ID	Year	Make	Model	Total
1	128	2010	Infiniti	G37	128
2	124	2015	Jeep	Wrangler	124
3	15	2014	Audi	S4	120
4	113	2012	Acura	Tsx sportwagon	116
```
- Moreover, the current **output.csv** file is not properly sorted to rank the results in a manner that emphasizes the calculated total for each vehicle. So, we introduce the **sort.awk**<br>script file which will comb through the primary output file, and produce a child output called **sorted.csv** which will have all of the vehicles sorted by total in descending order (highest total to lowest), and grouped by the Make.<br> The **sorted.csv** files has the output formatted as so:
```
Ranking Car_ID  Year    Make    Model   Total
1       112     2008    Acura   TL      110
2       50      2015    Acura   TLX     102
3       127     2013    Acura   Tsx     86
4       15      2014    Audi    S4      120
5       18      2015    Audi    S3      38
6       116     2008    Audi    A4      28
7       2       2016    Bmw     M2      24
8       172     2014    Bmw     4       22
9       111     2007    Bmw     328i    10 
```
- Notice how each make has three vehicles, for example: Acura has the TL, TLX, and Tsx printed, and the vehicle of make Acura with higest value in the total column being printed first, followed by the second highest, and the third highest.
  - Notice also how the makes are ranked alphabetically, with A's going first (Acura, Audi), then followed by letters with B (BMW).
- The sorted.csv file still has the vehicles ranked as well from 1 onwards, just like how it was done in the lab1.csv file.

## Contributors
Thanks to the following peple who have contributed to this project:
- [@ogre2](https://github.com/ogre2/)
- [@kyong4](https://github.com/kyong4/)
- [@tianye-chen](https://github.com/tianye-chen/)
- [@bohuinong](https://github.com/bohuinong)
- [@ayingtao11](https://github.com/ayingtao11)
- [@shua14](https://github.com/shua14)
