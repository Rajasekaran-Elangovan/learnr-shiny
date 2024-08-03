#index
#indx = "largemid250"
indx = "nifty50"

#path
rawdt<-paste0("S:/NSE Analysis/nseindex/",indx)
pgm<-"E:/R/indexanalysis/pgm_a"
anldt<-"E:/R/indexanalysis/pgm_a/datasets"

#library
library(readxl)
library(shiny)
library(dplyr)
library(ggplot2)
library(bsicons)
library(bslib)