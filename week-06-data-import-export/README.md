<!-- Please edit README.Rmd - not README.md -->

# Week 6: Data import / export

This week we’ll discuss different methods for import/exporting a range
of file types.

# Resources

-   [R for Data Science](https://r4ds.had.co.nz/transform.html) has some
    bits on loading/exporting data
-   Cheat sheet

# Exercises

1.  **Setup/Data import and library(s)**

        library(readxl)
        library(readr)
        library(data.table)
        library(readxl)
        library(DBI)
        library(odbc)       
        library(janitor)
        library(dplyr)
        library(fst)

2.  **Content**

    Today we will aim to cover and mainly focus on:

    We will cover

    -   Importing/writing .csv and .xlsx files
    -   `sie()` function
    -   Importing/writing .fst files
    -   Connecting to SQL
    -   Downloading table/views from SQL
    -   Writing to tables to SQL
    -   Import files from other software packages.

3.  **Import .csv and .xlsx**

    3.1 Import a CSV file from into R.

    3.2 Import a XLSX file into R.

    3.3 Write a CSV.

    3.4 Use the `sie()` function to view a CSV withput writting one.

4.  **Connect to an SQL database**

    4.1 Conncet to an SQL database that you have access to. All TAD
    staff should have access to \[TAD\_UserSpace\].

    4.2 You will need to create a config.yml file look at the
    presentation to help you. See example below:

    in config.yml

    `default:   tad_user_sql:     driver: "SQL Server Native Client 11.0"     server: "3DCPRI-PDB16\\ACSQLS"     database: "TAD_UserSpace"     uid: ""     pwd: ""     trusted: "Yes"     encoding: "LATIN1"`

    Use connection function then line below

    tad\_user\_con &lt;- connection\_function(tad\_user\_sql,
    “TAD\_UserSpace”)

5.  **Download from data from SQL connection**

    5.1 Download data from SQL with the conncetion you just made. You
    can do this any other the three ways explained in presenation.

6.  **`.fst` and `haven`**

    6.1 Create a .fst file from a large file you have. See how much
    quicker it is to load. 6.2 If you have an SPSS, STATA or SAS file
    try and use `haven` package to read in the data.
