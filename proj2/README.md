# proj2

Description:
This project prints the total, car_ID, year, make, model, ranking, on the first row and then copies car_ID, year, make, model from data.csv to report.csv. From the terminal, there will be  several commands which will sort it based off of ranking and categorize top 3 cars of each class which will be output into sortedreport.csv and output.csv. (overall, make, racer score, mods, mods overall, car overall, body frame, engine)


How to Execute the program:
Step 1: Copy data to local machine. The repo contains a single file named `data.csv`

```sh
git submodule add -f https://gist.github.com/d66a59b6db4e59c16efd4c42ad411f8e.git data
```

Step 2: Data analysis

Creates a column called total that adds the results based off the data you need to find.
The program will sort report.csv based on the total, in descending order.

Known bugs with awk script:
Data from data.csv that contain a space is read into two different columns.
For example, if Car-make is "Hello world", "Hello" is read into column n and "world" is read into column n+1.
Temp fix: The model name will be replaced with "Model". Now, ranking will sort properly except for the column that
contains the Make: Civic coupe (the only string that contains an empty space inbetween).

-----------------------------------
How to run prog.awk:
`awk -f prog.awk data/data.csv  > report.csv`

To sort the rankings by numeric order:
`paste -d' ' <(cut -d' ' -f1-5 report.csv )  <(cut -d' ' -f6- report.csv |sort -n) >sortedreport.csv`

Typing this in the terminal will cut out columns 1 to 5 of report.csv and print it. Then it will take out column 6 (the Ranking column) of report.csv and sort it in numerical order then
print to sortedreport.csv

Print top three cars in descending order:
`awk '{if ($6 <= 3) {print}}' sortedreport.csv > output.csv`

Takes the top three rows (excluding the header) from sortedreport.csv and then prints to output.csv


-----------------------------------
How to Run Each Class:


[Racer folder:](https://github.com/AndrewLee-Ace/cisc3140_lab3/tree/Kristy/proj2/racer)

- `awk -f racer/prog.awk data/data.csv > racer/report.csv `     
- `paste -d' ' <(cut -d' ' -f1-5 racer/report.csv )  <(cut -d' ' -f6- racer/report.csv |sort -n) > racer/sortedreport.csv`
- `awk '{if ($6 <= 3) {print}}' racer/sortedreport.csv > racer/output.csv`

[Engine folder:](https://github.com/AndrewLee-Ace/cisc3140_lab3/tree/Kristy/proj2/engine)
- `awk -f engine/prog1.awk data/data.csv > engine/report.csv`      
- `paste -d' ' <(cut -d' ' -f1-5 engine/report.csv )  <(cut -d' ' -f6- engine/report.csv |sort -n) > engine/sortedreport.csv`
- `awk '{if ($6 <= 3) {print}}' engine/sortedreport.csv > engine/output.csv`

[Body_Frame Folder:](https://github.com/AndrewLee-Ace/cisc3140_lab3/tree/Kristy/proj2/body_frame)
- `awk -f body_frame/prog2.awk data/data.csv > body_frame/report.csv`      
- `paste -d' ' <(cut -d' ' -f1-5 body_frame/report.csv )  <(cut -d' ' -f6- body_frame/report.csv |sort -n) > body_frame/sortedreport.csv`
- `awk '{if ($6 <= 3) {print}}' body_frame/sortedreport.csv > body_frame/output.csv`

[Mods Overall Folder:](https://github.com/AndrewLee-Ace/cisc3140_lab3/tree/Kristy/proj2/mods_overall)
- `awk -f mods_overall/mods_overall.awk data/data.csv > mods_overall/report.csv`     
- `paste -d' ' <(cut -d' ' -f1-5 mods_overall/report.csv )  <(cut -d' ' -f6- mods_overall/report.csv |sort -n) > mods_overall/sortedreport.csv`
- `awk '{if ($6 <= 3) {print}}' mods_overall/sortedreport.csv > mods_overall/output.csv`

[Mods:](https://github.com/AndrewLee-Ace/cisc3140_lab3/tree/Kristy/proj2/mods)
- `awk -f mods/mods.awk data/data.csv > mods/report.csv`      
- `paste -d' ' <(cut -d' ' -f1-5 mods/report.csv )  <(cut -d' ' -f6- mods/report.csv |sort -n) > mods/sortedreport.csv`
- `awk '{if ($6 <= 3) {print}}' mods/sortedreport.csv > mods/output.csv`

[Car Overall:](https://github.com/AndrewLee-Ace/cisc3140_lab3/tree/Kristy/proj2/car_overall)
- `awk -f car_overall/car_overall.awk data/data.csv > car_overall/report.csv`      
- `paste -d' ' <(cut -d' ' -f1-5 car_overall/report.csv )  <(cut -d' ' -f6- car_overall/report.csv |sort -n) > car_overall/sortedreport.csv`
- `awk '{if ($6 <= 3) {print}}' car_overall/sortedreport.csv > car_overall/output.csv`
