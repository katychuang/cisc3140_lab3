# proj2

### Project Description
**Step 1:** Copy raw data to local machine. The repo contains a single file named `data.csv`

"Data.csv" contains all information for program to run and execute commands
```sh
git submodule add -f https://gist.github.com/d66a59b6db4e59c16efd4c42ad411f8e.git data
```

**Step 2:** Data analysis 

Description of prog.awk:
Prints Total, car_ID, year, make, model, ranking, on the first row.
Copies car_ID, year, make, model from data.csv to report.csv.

The data under Ranking will NOT be filled with the script.
Creates a column called total that adds the results from column 8 to the last column of the file.
The program will sort report.csv based on the total, in descending order.

-----------------------------------
### Running The Script
After running the script with: 
``` sh
awk -f prog.awk data.csv  > report.csv
```

To sort the rankings by numeric order:
``` sh
paste -d' ' <(cut -d' ' -f1-5 report.csv )  <(cut -d' ' -f6- report.csv |sort -n) >sortedreport.csv
```

Typing this in the terminal will cut out columns 1 to 5 of report.csv and print it.

#### Then it will take out column 6 (the Ranking column) of report.csv and sort it in numerical order then print to sortedreport.csv
----
*To have a user option specific interface MUST use commands recieved by MAKEFILE. See README from "cisc3140_lab3" repository.*