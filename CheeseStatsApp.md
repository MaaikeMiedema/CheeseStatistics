Cheese Statistics App
========================================================
author: Maaike Miedema
date: June 20, 2017
autosize: true

Introduction
========================================================
As part of the Coursera class Developing Data Products I have made a shiny app in R on the growth of cheese and milk production in the Netherlands.
I love cheese and Statistics Netherlands happens to have collected data on milk and cheese for over a century...

You can find the Cheese Statistics App at:  
<a href= https://maaikemiedema.shinyapps.io/cheesestatistics>
   MaaikeMiedema.shinyapps.io/cheesestatistics </a>  
Code and Data:  
<a href= https://github.com/MaaikeMiedema/CheeseStatistics> 
   github.com/MaaikeMiedema/CheeseStatistics </a>

About the app
========================================================

The app shows two cheese production graphs in two panels:  

1. A time series with absolute growth (in millions kg)
2. A time series with relative growth, 1930 being the reference year 

You can:  

- Choose two extra variables to be displayed in both graphs.
- Vary the time frame displayed by sliding the bar below a graph.


Discover
========================================================
- When the European legislation succesfully halted the growth of the milk lake.
- That the production of cheese is not proportional to the number of cows.
- Implicitly: The succes of farmer owned dairy factories. Farmers started to organize by the end of the 19th century.
- And ...

Data
========================================================
Most of the data downloaded from <a href=http://statline.cbs.nl> Statistics Netherlands </a> and cleaned to a dataframe of folowing structure: 


```
'data.frame':	124 obs. of  6 variables:
 $ year         : Date, format: "1893-01-01" "1894-01-01" ...
 $ dairyCows    : int  NA NA NA NA NA NA NA NA NA NA ...
 $ milkTotal    : int  2265 2392 2415 2479 2512 2663 2610 2624 2636 2640 ...
 $ milkToFactory: int  300 360 422 524 641 750 829 851 897 940 ...
 $ cheese       : int  49 52 56 60 65 73 70 76 76 77 ...
 $ inhabitants  : num  NA NA NA NA NA NA NA NA NA NA ...
```
The NA's are due to the fact that collection of some data started later. 
