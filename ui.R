
library(shiny)
library(dygraphs)


selectionNames<-c("Cheese"= "cheese", "Number of Dairy Cows( x 1000)"="dairyCows",  
                  "Total Milk Production (mln kg)"="milkTotal", 
                  "Milk to Factories (mln kg)"="milkToFactory", 
                  "Inhabitants Gouda ( x 100)"= "inhabitants")
shinyUI(fluidPage(
 
  titlePanel("Dutch Cheese and Milk Production"),

  sidebarLayout(
     
          sidebarPanel(
                  h4("Select variables for extra lines in the graph"),
                  selectInput("line1", "First", selectionNames,
                              selected = selectionNames[1]),# default value
                  selectInput("line2", "Second", selectionNames,
                              selected = selectionNames[1]),# default value
                  br(),
                  p("Note: just for fun, check out the relation between cheese 
                    production and the number of inhabitants of Gouda, 
                    the city the famous Dutch Gouda is named after.")
          ),
          mainPanel(
                  tabsetPanel(
                          id = "milk panels",
                          tabPanel("absolute growth", br(),dygraphOutput("tsCheese"),
                                   br(),
                                   em(h5("* Slide to set different time frame", br(),
                                         "* Move mouse over graph to see values"))
                                   ),
                          tabPanel("relative growth",br(), dygraphOutput("tsRelative"),
                                   br(),
                                   em(h5("* Slide to set different time frame", br(),
                                         "* Move mouse over graph to see values"))
                                   ),
                          tabPanel("about", 
                                   br(),
                                   p("This app has been made as assignment for the Developing Data Products 
                                     class by Johns Hopkins University on Coursera."), 
                                   h4("Source of Data"),
                                   a( href="http://statline.cbs.nl", "Statistics Netherlands"),
                                   p("For Gouda population and  dairy production data downloaded. 
                                      At this site you can construct your own datafiles. 
                                      The data needs some cleaning afterwards to ged rid of headers and annotation."),
                                   a(href="http://www.dbnl.org/","Dutch Digital Library"),                                   
                                   p("For Gouda population data 1920-1955, 5 -yearly. 
                                      Manually subtracted from archived statistics
                                      publications. Searched for \"bevolkings\""),
                                   h4("Code"),
                                   p("Code and data sets can be found at"),
                                   a(href="http://statline.cbs.nl"),
                                   h4("Improvements"),
                                   p("I would have liked to select an empty second/third variable, 
                                     to get rid of the strange legend in the graphs. Didn't manage to get it right.")
                                   )
                          
                          
                  )
             
          )
  )          
))