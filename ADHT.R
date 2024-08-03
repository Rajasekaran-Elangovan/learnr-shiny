#----------------------------------------------------------------------#
#------------ G E T T I N G   C O M P L E T E   D A T A    ------------#
#----------------------------------------------------------------------#
#library
library(readxl)
library(shiny)
library(dplyr)
library(ggplot2)
library(bsicons)
library(bslib)

#----------------------------------------------------------------------#
#------------ G E T T I N G   C O M P L E T E   D A T A    ------------#
#----------------------------------------------------------------------#

#setting working directory
setwd("S:/NSE Analysis/nseindex")
getwd()

#getting all index details from directory
allindexp <- list.files(all.files = TRUE,no.. = TRUE)

#creating a list 
compfile <- list()

#no of index details
lenfil <- length(allindexp)

#defining j as 1 
j=1

#creating a loop to run all index
while (j<=lenfil) {
  
  #----------------------------------------------------------------------#
  #------------ G E T T I N G      R A W     D A T A    -----------------#
  #----------------------------------------------------------------------#
  #selecting index to work on
  indx<- allindexp[j]
  #path
  rawdt<-paste0("S:/NSE Analysis/nseindex/",indx)
  pgm<-"E:/R/indexanalysis/pgm_a"
  anldt<-"E:/R/indexanalysis/pgm_a/datasets"
  
  #set working directory to raw data location
  setwd(rawdt)
  
  #view working directory
  getwd()
  
  #get list of all .csv files from working directory
  alldata<- list.files(pattern=".csv")

  #Header of a string
  txt <- gregexpr('-',alldata[1])
  #total count of file
  allcsv<- alldata[length(alldata)]  
  #creating Title of the index
  tit <- substr(alldata[1],1,txt[[1]][1]-1) 
  
  #count of CSV files
  maxf <- length(alldata)
  
  #creating list called CSVDT
  csvdt <- list()
  #initializing i as 1
  i = 1 
  #loop to import all csv files
  while(i<=maxf){
    #name of each file
    print(alldata[i])
    
    #complete import path of each file
    pth=paste0(rawdt,"/",alldata[i])
    print(pth)
    
    #dataset name for each file
    a=paste0("ds0",i)
    
    #assigning data to a dataset name
    assign(a,read.csv(pth))
    
    #add dataset name to csvdt list
    csvdt[[i]] <- get(a)
    i=i+1
  }
  
  #combining all datasets in csvdt list (equivalent to set in SAS programming)
  dscomp <- do.call(rbind,csvdt)
  
  #----------------------------------------------------------------------#
  #------------ C L E A N I N G      R A W     D A T A    ---------------#
  #----------------------------------------------------------------------#
  setwd(anldt)
  getwd()
  
  names(dscomp)<-c('date','open','high','low','close','volume','turnovr')
  
  dscomp$param <- tit
  dscomp$date <- as.Date(dscomp$date,format = "%d-%b-%Y")
  
  dscomp <- dscomp %>% distinct()
  
  mxdt<- max(dscomp$date)
  
  dscomp$range <- ifelse(between(dscomp$date,(mxdt-7),mxdt),1,
                         ifelse(between(dscomp$date,(mxdt-30),mxdt),2,
                                ifelse(between(dscomp$date,(mxdt-90),mxdt),3,
                                       ifelse(between(dscomp$date,(mxdt-180),mxdt),4,
                                              ifelse(between(dscomp$date,(mxdt-365),mxdt),5,
                                                     ifelse(between(dscomp$date,(mxdt-730),mxdt),6,
                                                            ifelse(between(dscomp$date,(mxdt-1095),mxdt),7,
                                                                   ifelse(between(dscomp$date,(mxdt-1825),mxdt),8,9))))))))
  
  assign(indx,dscomp)
  
  compfile[[j]] <- get(indx)
  j=j+1
}

indexdatas <- do.call(rbind,compfile)
indexdata <- indexdatas[order(indexdatas$date),]
foot1="Data for the plot was obtained from NSE official website"
foot2=paste("Data till", mxdt ,"was presented as chart")