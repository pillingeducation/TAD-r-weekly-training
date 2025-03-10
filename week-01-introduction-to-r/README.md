Introduction to R
================

- <a href="#initial-setup" id="toc-initial-setup">Initial Setup</a>
  - <a href="#workspace" id="toc-workspace">Workspace</a>
  - <a href="#code-diagnostics" id="toc-code-diagnostics">Code
    Diagnostics</a>
  - <a href="#syntax-highlighting-console-output"
    id="toc-syntax-highlighting-console-output">Syntax Highlighting Console
    Output</a>
  - <a href="#colours-and-display" id="toc-colours-and-display">Colours and
    Display</a>
  - <a href="#set-up-r-project" id="toc-set-up-r-project">Set up R
    Project</a>
- <a href="#rstudio" id="toc-rstudio">RStudio</a>
  - <a href="#rstudio-layout" id="toc-rstudio-layout">RStudio Layout</a>
  - <a href="#rstudio-projects" id="toc-rstudio-projects">RStudio
    Projects</a>
  - <a href="#keyboard-shortcuts" id="toc-keyboard-shortcuts">Keyboard
    Shortcuts</a>
  - <a href="#tab-complete." id="toc-tab-complete.">Tab-Complete.</a>
  - <a href="#most-importantly---google-google-google"
    id="toc-most-importantly---google-google-google">Most importantly -
    Google Google Google</a>
- <a href="#r" id="toc-r">R</a>
  - <a href="#r-basics" id="toc-r-basics">R Basics</a>
  - <a href="#functions" id="toc-functions">Functions</a>
  - <a href="#types" id="toc-types">Types</a>
  - <a href="#factors" id="toc-factors">Factors</a>
  - <a href="#ordered-factors" id="toc-ordered-factors">Ordered factors</a>
  - <a href="#boolean" id="toc-boolean">Boolean</a>
  - <a href="#coercion" id="toc-coercion">Coercion</a>
  - <a href="#vectors" id="toc-vectors">Vectors</a>
  - <a href="#data-frames" id="toc-data-frames">Data Frames</a>
  - <a href="#packages" id="toc-packages">Packages</a>
- <a href="#resources" id="toc-resources">Resources</a>

# Initial Setup

## Workspace

Tools \> Global Options \> General Under Workspace:

1.  Untick restore RData
2.  Never Ask about saving

## Code Diagnostics

``` r
install.packages("lintr")
```

- Tools \> Global Options \> Code \> Diagnostics
- Tick everything EXCEPT “Warn if variable has no definition in scope”

## Syntax Highlighting Console Output

- Tools \> Global Options \> Console
- Tick top box (Show syntax highlighting…)

## Colours and Display

- Tools \> Global Options \> Appearance
- I’m using a light theme for screen sharing, but I’d use a dark theme
  for actual coding.

## Set up R Project

Setup up an R projects for these sessions:

- File \> New Project \> New Directory \> New Project
- Give it a name and a location (NOT in OneDrive)

You can access Projects in the top right drop-down.

If you’re cloning this from the GitHub repo, New Project \> Version
Control \> Git \> paste in the link from the repo.

# RStudio

- NOT R. RStudio is an Integrated Development Environment (IDE) for
  coding.
- You can write R code using notepad if you want to.
- But RStudio is recommended because it makes life easier

## RStudio Layout

- Top left is your script/source code. All your analysis goes here.
- Top right is environment (+ others). It lets you see current objects.
- Bottom left is console - you can write and send code there.
- Bottom right is file explorer, but also plot window

``` r
rnorm(n = 100, mean = 0, sd = 1) |>
  hist()
```

## RStudio Projects

- Keep files together
- Sort out working directory

## Keyboard Shortcuts

- use them!

- Ctrl + Enter - runs the block of code - use this after every line of
  code

- Ctrl + Shift + Enter - run the entire file

- Ctrl + Tab

- Ctrl + Shift + Tab

- Ctrl + S, Ctrl + Z etc…

## Tab-Complete.

- Use this as often as Ctrl + Enter!

## Most importantly - Google Google Google

- 90% of the time, it works every time
- If you can’t find what you need, or don’t know what it’s called, ask
  me.

# R

## R Basics

- R is scripting language - much more interactive than SQL
- Generally you should run each line as you write it, to make sure it
  works as you expect.

### R Scripts

- This is your work - it should have everything
  - Downloading/importing data
  - Data cleaning
  - Outputs

### Maths

Maths works similar to excel.

``` r
5 + 5
3 / 5
```

### Comments

- Use them to explain **why** your code is doing something.

``` r
# Everything after `#` is a comment
5 + 5
```

### Logic

``` r
5 == 5 # is equal
5 != 5 # is not equal
TRUE | FALSE # OR
T & F # AND
# TRUE and FALSE can be abbreviated to T and F but not recommended.
!TRUE # NOT
2 > 5
5 <= 10
```

``` r
(T & F) | (T & T)
```

### Variables

- Assignment is with `<-` or `=`.
- Prefer `<-`

``` r
x <- 5
y = 4
```

### Briefly on names….

- Use snake_case or camelCase and stick with it.

- GIVE YOUR VARIABLES INFORMATIVE NAMES

- BAD

``` {r
x <- 1.02
```

- GOOD

``` r
inflation_uplift <- 1.02
```

## Functions

- Similar to excel

``` r
rnorm(n = 100, mean = 0, sd = 1)
rnorm(100, 0, 1)
```

- Give names to non-obvious arguments.
- The above is clear but this isn’t:

``` r
rnorm(100, 100, 100)
```

### You’ll learn over time what’s obvious and what isn’t.

- In this example mean and sd aren’t obvious, but in all dplyr function
  data is the first argument, so you don’t have to write “data = iris”,
  every time.
- Functions are indicated by () after the name.
- Not all functions require arguments

``` r
ls()
ls
```

## Types

### Atomic Types

- Atomic because they make up all the other types

- The 4 core ones are:

- Numeric (integer/double)

- Character

- Factor

- Boolean/Logical (True False)

But there’s many others (Date/time, complex etc)

### Numerics

``` r
class(5L)
class(5.0)
```

### Strings/Characters

``` r
class('5')
class("foo")
```

- Maths makes sense with numerics

``` r
5/3
```

- Some maths works but doesn’t make sense with characters

``` r
"100" > 20
```

## Factors

- Integers and Characters put together
- Useful for ‘multiple choice’ like:

``` r
school_status <- c("LA Maintained", "Non-LA Maintained")
school_status <- factor(school_status)
```

- Useful in other scenarios, like plotting a chart or running a
  regression with dummy variables.

## Ordered factors

``` r
teachers <- c("M1", "M4", "M2")

teachers_factor <- ordered(teachers,
                           levels = c("M1", "M2", "M3", "M4"))

teachers_factor

teachers_factor[3] > teachers_factor[2]
```

- Square brackets can be used to select elements

``` r
c(10, 20, 30)[3]
```

## Boolean

``` r
TRUE
T
FALSE
F
```

## Coercion

``` r
TRUE + TRUE # Implicit
as.numeric(TRUE) # Explicit
as.numeric(FALSE) # Explicit
```

``` r
"5" + "8" # Doesn't always happen implicitly
as.numeric("5") + as.numeric("8")

as.numeric
as.character
as.Date
as.logical
as.
```

### NA’s

``` r
5 == 2 + 3
```

``` r
NA == NA
```

``` r
5 == NA
```

``` r
wojtek_age <- NA
sam_age <- NA
wojtek_age == sam_age 
```

``` r
mean(c(1, 2, 3))
```

``` r
mean(c(1, 2, 3, NA))
```

``` r
mean(c(1, 2, 3, NA), na.rm = TRUE)
```

Be careful coming from SPSS, where NA’s are coded as negative values.

``` r
x <- c(-8, -9, 1, 2)
mean(x)

x <- dplyr::na_if(x, -8)
x <- dplyr::na_if(x, -9)

x
mean(x, na.rm = TRUE)
```

## Vectors

- Everything is a vector
- A vector is just a column, but of the same type

``` r
identical(1, c(1))
```

- `c()` is used to make a vector with multiple elements

- `1:100` : makes a sequence

### R recycles vectors

``` r
economic_data <- c(1:4) # same as c(1,2,3)
inflation_uplift <- 1.02

economic_data * inflation_uplift

length(economic_data)
length(inflation_uplift)

yearly_inflation_uplift <- c(1.02, 1.07, 1.20, 1.50)

economic_data * yearly_inflation_uplift
```

- You want to always use vectors of the same length, or vectors of
  length 1.

- This works but don’t do it

``` r
economic_data * c(1.02, 1000, 2) # Will work but gives warning message

c(1:10) + c(10, 100) # Will works but you should never use it

length(c(1:10))
length(c(10, 100))
```

## Data Frames

- Rectangular data, made up of atomic elements
- Think columns and rows (sheet).

``` r
penguins <- palmerpenguins::penguins
```

### “Explore your data” functions

``` r
class(penguins) # Type of object

class(penguins$bill_length_mm)

names(penguins) # Names of data.frame

str(penguins) # Structure

summary(penguins)
```

## Packages

- Very important element of R - it’s how you add extra functionality

- Install using

``` r
install.packages("tidyverse")
```

- Load packages using

``` r
library(tidyverse)
```

# Resources

- [R for Data Science](https://r4ds.hadley.nz/)
