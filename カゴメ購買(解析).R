# see : https://github.com/opetchey/RREEBES/wiki/Reading-data-and-code-from-an-online-github-repository
# see : https://stackoverflow.com/questions/14441729/read-a-csv-from-github-into-r

setwd("/Users/jclee/Desktop/kagome")

suppressMessages(library(RCurl))
suppressMessages(library(tidyverse))
# install.packages("RCurl")

# read from web
# koubai.address <- getURL(
#   "https://raw.githubusercontent.com/luka3117/kagome/master/total.csv"
# )
# koubai<-read.csv(text = koubai.address, row.names = 1) %>%
#   tbl_df() %>% select(-平均価格, -ブランド詳細)

koubai <- read.csv("total.csv", row.names = 1) %>% tbl_df

# factor 型データ
koubai.factor <-
  koubai %>% select(age, sex, データ種別, カテゴリー大, メーカー)

# 数値 型データ
koubai.numeric<-
koubai %>% select_if(is.numeric) %>%
# select(-JANコード,-累積シェア, -金額シェア, -枝番, -購入率) %>% 
select(順位,X100人あたり購入金額,購入者あたり購入金額) 

# 購入先データ
koubai.store<-koubai %>% select(スーパー:その他購入先) %>% round(2)

kagome.sales<-bind_cols(koubai.factor,koubai.numeric) %>% select(-順位) %>%
  bind_cols(koubai.store, .) %>% select(age, sex,データ種別, カテゴリー大, メーカー, everything()) 


# koubai %>% select_if(is.factor) %>% 
#     lapply(levels) %>% sapply(.,length) %>% sort() 

