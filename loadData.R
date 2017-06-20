# Loads the csv files available in working directory
# Combines them to two dataframes used by the app: 
# cheeseData: with absolute data, relative: with relative growth data

library(dplyr)
library(stringr)
library(lubridate)


# Load data
gouda1954<-read.csv("Gouda_1925_1954.txt")
gouda1960Plus<-read.csv("Gouda_1960_now.csv", sep=";", header=FALSE, na.strings = ".")
agriData<-read.csv("Agriculture1851_now.csv", sep=";", header=FALSE, na.strings = ".")

# clean agriData
agriData<- agriData[2:7,4:171]
agriData<- apply(agriData,c(1,2), gsub, pattern="[*]", replacement="") #NOTE the [*]
agriData<- apply(agriData,2,as.integer)
agriData<-agriData %>% t() %>% as.data.frame(row.names=NULL)
names(agriData)<-c("year","dairyCows","milkTotal","milkToFactory", "milkOther", "cheese")        
agriData$year<-ymd(str_c(agriData$year,("-01-01")))
agriData<-filter(agriData,year >= ymd(str_c(1893,("-01-01")))) %>%
        select(-milkOther)

#clean and combine Gouda population data
gouda1960Plus<-gouda1960Plus[c(2,4),-(1:3)]
gouda1960Plus<- t(apply(gouda1960Plus,2,as.integer)) %>% as.data.frame(row.names = NULL)
names(gouda1960Plus)<-c("year","inhabitants")
gouda1954<-select(gouda1954, -source)
gouda <- rbind(gouda1954,gouda1960Plus)
# gouda$year<-ymd(str_c(gouda$year,("-01-01")))
gouda <- gouda %>%
        mutate(year = ymd(str_c(year,("-01-01")))) %>%
        mutate (inhabitants=inhabitants/100)

# combine the datasets to one

cheeseData <- left_join(agriData,gouda, by = "year")
rownames(cheeseData)<-as.character(cheeseData$year)

# relative data
relative<-as.matrix(cheeseData[,-1])
relative<-ifelse(is.na(relative),0, relative)
refYear<-filter(cheeseData,year=="1930-01-01")[-1]
refYear<-diag(1/refYear)
relative<-relative%*%refYear 
relative<-ifelse(relative<0.0001, NA ,relative)
colnames(relative)<-colnames(cheeseData)[-1]

