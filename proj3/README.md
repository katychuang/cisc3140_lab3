# proj3

`data.csv` file contains information of cars and owners

* Using the provided `data.csv` file, extract relevant fields.
* Sum up the relevant fields to get a score used to rank each car.
* Sort in descending order using scores and set in a seperate file (sorted_ranks)
* To get the top three cars of each maker, sort by maker first then ranking
* At the end, will display the original set of data
* Followed by the sorted ranks in descending order
* Followed by the top three cars of each maker

**Files and Directory:**

```
.
|-- Makefile
|-- README.md
|-- data/
|   `-- data.csv
|-- proj1/
|-- proj2/
`-- proj3/
    |-- README.md
    |-- prog1.awk
    `-- prog2.awk

4 directories, 10 files
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

    make p3
```

When the GNU Make command is ran, you will be prompted with these messages in the terminal/CLI indicating that scripts have successfully executed and compiled our results.
```
Running AWK Script proj3:
#awk file produces three seperate files: top_3, ranks, and headers (headers added to the final files)
awk -f proj3/awk/prog1.awk data/data.csv
#sorts ranks in descending order via scores and placed in a
#new file: sorted_ranks.
sort -k5,5n -r -t ',' proj3/ranks.csv | awk -f proj3/awk/AddRanking.awk > "proj3/Output/sorted_ranks.csv"
# Sorts top_3 via make first then ranks, prints top LIMIT cars of each make
sort -k3,3 -k5,5n -r -t ',' proj3/top_3.csv | awk -f proj3/awk/AddRanking.awk | \
awk -v var="3" -f  proj3/awk/SortTotal.awk > "proj3/Output/top_3_by_make.csv"
# Gets top LIMIT of each category
awk -v var="3" -f proj3/awk/classes.awk data/data.csv > proj3/Output/classes.csv
#Adding headers to final files
cat proj3/headers.csv proj3/Output/sorted_ranks.csv > "sorted_ranks.csv"
cat proj3/headers.csv proj3/Output/top_3_by_make.csv > "top_3_by_make.csv"
#move to proj3 directory
mv sorted_ranks.csv proj3/Output
mv top_3_by_make.csv proj3/Output
# Remove temp files
rm proj3/headers.csv
rm proj3/ranks.csv
rm proj3/top_3.csv
#Display the files
echo "\nSorted Ranks\n"

Sorted Ranks

cat proj3/Output/sorted_ranks.csv

echo "\nTop 3 of each make\n"

Top 3 of each make

cat proj3/Output/top_3_by_make.csv
```
## Results
Results will be stored as a .csv file within the project output directory which you can navigate to by running this command once you're inside the
main project directory.
```
cd proj3/output/
```
## Explaining results
Below, we will define the results of the data found in the output folder.
* The **sorted_ranks.csv** is the output file that shows the result of ranking in descending order based on the total
* The **top_3_by_make.csv** is the output file that shows the result of top 3 cars in each of the different Make group based on its total.
* The **classes.csv** is the output file for the new feature which outputs the top 3 cars as default for each of the new classes listed in the new features.
* The **AddRanking.awk** is an awk file that helps adding a ranking column to the data.
* The **SortTotal.awk** is an awk file that helps sorting the data based on the total.
* The **classes.awk** is an awk file for printing the results of the new feature that defined the **classes.csv**
* The **prog1.awk** is the main awk file that prints out the main functionally of this project.

## New Options during execution
* The first option was enable user to reverse the sorting order to either ascending or descending.
    * Have the variable Order = to something in the command line.
    * Order = "" means ascending order and descending is the default so u don't need to include it
* the second option was to enable user to find the top of x numbers of cars instead of 3 as default.
    * Have the variable Limit = to something in the command line 
    * Limit = "x" where x is an integer means that it would show the ranking of x number of cars instead of 3 as default

## Instructions on How to Execute The New Options
The linux commands to execute the new options are shown below:
* First Option
```
make p3 ORDER=""
```
* Second Option
```
make p3 Limit="6"
```
* Both Option
```
make p3 ORDER = "" Limit = "6"
```

## Contributors
Thanks to the following peple who have contributed to this project:
- [@ogre2](https://github.com/ogre2/)
- [@kyong4](https://github.com/kyong4/)
- [@tianye-chen](https://github.com/tianye-chen/)
- [@bohuinong](https://github.com/bohuinong)
- [@ayingtao11](https://github.com/ayingtao11)
- [@shua14](https://github.com/shua14)
