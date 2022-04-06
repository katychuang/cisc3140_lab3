# proj2
## Description
The report show aggregate values that are computed from the CSV file provided by
```sh
git submodule add -f https://gist.github.com/d66a59b6db4e59c16efd4c42ad411f8e.git data
```
## Dependencies 

* Sample Data: https://gist.github.com/katychuang/d66a59b6db4e59c16efd4c42ad411f8e
* BC Linux machines

You must have the following installed. The linux commands to install necessary packages shown below: 

* GNU Make
  ```sh
  sudo apt-get install build-essential
  ```
  
# Installation
Copy repo to local machine. The repo contains a single file named `data.csv`

```sh
$ git clone git@github.com:ArmandoPerez09/cisc3140_lab3.git
$ git submodule init
$ git submodule update
$ make p2
```

## Requirements
1. Description of [prog.awk](awk_script/prog.awk):
- Prints Total, car_ID, year, make, model on the first row.
- Copies car_ID, year, make, model from data.csv to [report.csv](output_file/report.csv)
- The data under Ranking will NOT be filled with the script.
- Creates a column called total that adds the results from column 8 to the last column of the file.
- The program will sort report.csv based on the total, in descending order.

2. Description of [ranking.awk](awk_script/ranking.awk):
- Prints ranking on the last column.
- Copies car_ID, year, make, model from data.csv to [sortedreport.csv](output_file/sortedreport.csv)

3. Description of [top3.awk](awk_script/top3.awk):
- Prints a list of top three cars overall.
- Copies car_ID, year, make, model from data.csv to [top3.csv](output_file/top3.csv)

4. Description of [rankingAndMake.awk](awk_script/rankingAndMake.awk)
- According sortedreport.csv to sort the cars by make, then each makes sorted by total score.
- Then Copy this description command line to the termenal. 
```
awk 'word!=$4{count=1;word=$4} count<=3{print; count++}' proj2/output_file/rankingAndMake.csv > proj2/output_file/topThreeEachMake.csv
```
- Prints a list of top three cars per make to [topThreeEachMake.csv](output_file/topThreeEachMake.csv).

5. Description of [Racer.awk](awk_script/Racer.awk):
- Prints Car_ID, total for Racer class, and rank, on the first row. 
- Copies Car_ID from data.csv to [rankRacer.csv](output_file/rankRacer.csv)
- Add a colum called total that adds the results from column 10 to column 14 of the file.
- Then print out the top three racer with 1 2 3 ranks.

6. Description of [Engine.awk](awk_script/Engine.awk):
- Prints Car_ID, total for Racer class, and rank, on the first row.
- Copies Car_ID from data.csv to [rankEngine.csv](output_file/rankEngine.csv)
- Add a colum called total that adds the results from column 15 to column 19 of the file.
- Then print out the top three engine with 1 2 3 ranks. 

7. Description of [Body_Frame.awk](awk_script/Body_Frame.awk):
- Prints Car_ID, total for Racer class, and rank, on the first row.
- Copies Car_ID from data.csv to [rankBody_Frame.csv](output_file/rankBody_Frame.csv)
- Add a colum called total that adds the results from column 20 to column 24 of the file.
- Then print out the top three Body_Frame with 1 2 3 ranks.

8. Description of [Mods.awk](awk_script/Mods.awk):
- Prints Car_ID, total for Racer class, and rank, on the first row.
- Copies Car_ID from data.csv to [rankMods.csv](output_file/rankMods.csv)
- Add a colum called total that adds the results from column 25 to column 33 of the file.
- Then print out the top three mods with 1 2 3 ranks.

9. Description of [top3Mods_Overall.awk](awk_script/top3Mods_Overall.awk):
- Prints Car_ID, Email, Name, Mods_Overall,and rank, on the first row.
- Copies Car_ID,Email,Name,Mods_Overall from data.csv to [top3Mods_Overall.csv](output_file/top3Mods_Overall.csv)
- Then print out the top three Mods_Overall with 1 2 3 ranks.

10. Description of [Car_Overall.awk](awk_script/Car_Overall.awk):
- Prints Car_ID, total for Racer class, and rank, on the first row.
- Copies Car_ID from data.csv to [rankCar_Overall.csv](output_file/rankCar_Overall.csv)
- Then print out the top three Car_Overall with 1 2 3 ranks.


## Known bugs
Known bugs with awk script:
- Data from data.csv that contain a space is read into two different columns.
- For example, if Car-make is "Hello world", "Hello" is read into column n and "world" is read into column n+1.
- Temp fix: The model name will be replaced with "Model". Now, ranking will sort properly except for the column that contains the Make: Civic coupe (the only string that contains an empty space inbetween).

-----------------------------------
After running the script with: 
`awk -f prog.awk data.csv  > report.csv`

To sort the rankings by numeric order:
`paste -d' ' <(cut -d' ' -f1-5 report.csv )  <(cut -d' ' -f6- report.csv |sort -n) >sortedreport.csv`

Typing this in the terminal will cut out columns 1 to 5 of report.csv and print it.

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


