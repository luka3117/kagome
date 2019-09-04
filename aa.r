# see : https://github.com/opetchey/RREEBES/wiki/Reading-data-and-code-from-an-online-github-repository
# see : https://stackoverflow.com/questions/14441729/read-a-csv-from-github-into-r

library(RCurl)
suppressMessages(library(tidyverse))
# install.packages("RCurl")

koubai.address <- getURL(
  "https://raw.githubusercontent.com/luka3117/kagome/master/total.csv"
)
koubai<-read.csv(text = koubai.address, row.names = 1) %>% tbl_df()


koubai %>% dim()
koubai %>% colnames()
koubai %>% summary()


