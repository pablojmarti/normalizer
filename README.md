# normalizer
Normalizing CSVs through a cli tool that takes in CSVs through stdin and will output the normalized utf-8 csv to stdout.

## Getting Started

### Prerequisites

- ruby - 2.7.0 - using a ruby version tool helps a lot

```
rbenv install 2.7.0
```

you can learn more about installing ruby [here](https://www.ruby-lang.org/en/downloads/)

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
