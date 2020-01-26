# normalizer
Normalizing CSVs through a cli tool that takes in CSVs through stdin and will output the normalized utf-8 csv to stdout.

## Getting Started

### Prerequisites

You will need ruby version 2.7.0 to run the program.

If you have a ruby version manager that responds to a .ruby-version file (rbenv), it should change automatically to the correct version if the manager already has the version installed.

### Up & Running

After pulling down the latest copy of master, you can use the following from the root of the repo to run the script

```
./normalizer < CSVIN 
```

This will output to the terminal the formated CSV file

From here you can pipe it into another csv file if needed

```
./normalizer < CSVIN > output.csv
```
