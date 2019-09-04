library(RCurl)
library(tidyverse)
install.packages("RCurl")

x <- getURL(
  "https://raw.githubusercontent.com/luka3117/kagome/master/total.csv"
)
read.csv(text = x) %>% tbl_df()
