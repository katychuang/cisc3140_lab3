# proj2

Step 1: Copy data to local machine. The repo contains a single file named `data.csv`

```sh
git submodule add -f https://gist.github.com/d66a59b6db4e59c16efd4c42ad411f8e.git data
```

Step 2: Data analysis

Description of prog.awk:
Prints Total, car_ID, year, make, model, ranking, on the first row.
Copies car_ID, year, make, model from data.csv to report.csv
The data under Ranking will NOT be filled with the script.
Creates a column called total that adds the results from column 8 to the last column of the file.
The program will sort report.csv based on the total, in descending order.

Known bugs with awk script:
Data from data.csv that contain a space is read into two different columns.
For example, if Car-make is "Hello world", "Hello" is read into column n and "world" is read into column n+1.
Temp fix: The model name will be replaced with "Model". Now, ranking will sort properly except for the column that
contains the Make: Civic coupe (the only string that contains an empty space inbetween).

-----------------------------------
After running the script with:
`awk -f prog.awk data/data.csv  > report.csv`
//added data in front because it's in the data folder

To sort the rankings by numeric order:
`paste -d' ' <(cut -d' ' -f1-5 report.csv )  <(cut -d' ' -f6- report.csv |sort -n) >sortedreport.csv`

Typing this in the terminal will cut out columns 1 to 5 of report.csv and print it.

Use this to only print out the first 3 from greatest to least:
  awk '{if ($6 <= 3) {print}}' sortedreport.csv > output.csv

Then it will take out column 6 (the Ranking column) of report.csv and sort it in numerical order then
print to sortedreport.csv


Known bugs: The string "Ranking" would get sorted along the with numbers and would not remain on top.
Temp fix: Attached "--Ranking" in the same column as Model.
-----------------------

Now, to create a new script that will search for unique name (by adding total string value we can get an unique ID)
For each make with a unique name, print top three. Total is already sorted, so the program just needs to
print the first three cars that matched the name. (Using a counter=0, when counter=3 move on next unique name. Use next;)

 touch topCarMakes.awk

Looks at column 1. Takes carmake and set as string(To use for comparison later)
Prints ranking, car_id, year, car make, car model, total score to new File.
Counter++; // This counter will move on to next car make on 3.

Now "skip" all car makes with the unique ID and restart until there is no more data in the .CSV.







Racer folder:
run the scripts with
- awk -f racer/prog.awk data/data.csv > racer/report.csv      
- `paste -d' ' <(cut -d' ' -f1-5 racer/report.csv )  <(cut -d' ' -f6- racer/report.csv |sort -n) > racer/sortedreport.csv`
- awk '{if ($6 <= 3) {print}}' racer/sortedreport.csv > racer/output.csv


Engine Folder:
- awk -f engine/prog.awk data/data.csv > engine/report.csv      
- `paste -d' ' <(cut -d' ' -f1-5 engine/report.csv )  <(cut -d' ' -f6- engine/report.csv |sort -n) > engine/sortedreport.csv`
- awk '{if ($6 <= 3) {print}}' engine/sortedreport.csv > engine/output.csv
