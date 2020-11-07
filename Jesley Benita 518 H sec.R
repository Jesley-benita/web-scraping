library(rvest)
library(robotstxt)
library(dplyr)
paths_allowed("https://www.thezoereport.com/p/the-35-best-eyeshadow-palettes-of-all-time-according-to-passionate-reviewers-22764751/")
link<-"https://www.thezoereport.com/p/the-35-best-eyeshadow-palettes-of-all-time-according-to-passionate-reviewers-22764751"
web<-read_html(link)

name<-web%>%html_nodes(".tRj")%>%html_text()
price<-web%>%html_nodes(".BmB")%>%html_text()
company<-web%>%html_nodes(".xBM")%>%html_text()

cosmetics<-data.frame(name,price,company)
View(cosmetics)

cosmetics$price<-gsub("\\$"," ",cosmetics$price)
cosmetics$price<-gsub(".00"," ",cosmetics$price)

View(cosmetics)

cosmetics$price<-as.numeric(cosmetics$price)
str(cosmetics)
