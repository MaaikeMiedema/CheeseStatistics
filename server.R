

library(shiny)
library(dygraphs)
library(xts)

source("loadData.R")

shinyServer(function(input, output) {
       
        # select data  and combine to new data frame
        selectedData<-reactive({ 
                cheeseData[,c("cheese",input$line1, input$line2)]
        
        })
        selectedRelative<-reactive({
               relative[,c("cheese",input$line1, input$line2)]
                
        })
        # construct timeseries graph
        output$tsCheese <- renderDygraph({
                dygraph(as.xts(selectedData()), main = "Absolute Growth") %>%
                        dyOptions(connectSeparatedPoints = TRUE)%>%
                        dyRangeSelector(dateWindow = c("1893-01-01", "2016-01-01"))
        })        
        output$tsRelative <- renderDygraph({
                        dygraph(as.xts(selectedRelative()), main = "Relative Growth, compared to 1930") %>%
                        dyOptions(connectSeparatedPoints = TRUE)%>%
                        dyRangeSelector(dateWindow = c("1893-01-01", "2016-01-01"))%>% 
                        dyEvent("1930-01-01", "Reference Date", labelLoc="bottom") %>% 
                        dyEvent("1984-04-02", "Milk quota", labelLoc = "bottom")%>%
                        dyEvent("1940-05-10", "WwII", labelLoc = "bottom")
        })
        
})
