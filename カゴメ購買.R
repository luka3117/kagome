suppressMessages(library(readxl))
suppressMessages(library(dplyr))
suppressMessages(library(tidyverse))


# setwd("/Users/jclee/Dropbox/[0000]マクロミル/DS2回生プログラミングコンテスト資料/DS2回生プログラミングコンテスト資料/07_カゴメ部門(FIX)/分析用データ/消費者購買履歴データ/02_QPRデータ/04_アイテムランキング/変数名変換")

dir(pattern = "ranking")
filename.list <- dir(pattern = "ranking")[-c(7)]
filename.list

sex.age.variable <-
  gsub("トマト調味料アイテムランキング", "", filename.list) %>%
  gsub("_ranking2_", "", .) %>%
  gsub("xls", "", .) %>%
  gsub("\\d{7}", "", .) %>%
  gsub("\\(|\\)", "", .) %>%
  gsub("\\.", "", .) %>%
  gsub("性", "性.", .) %>% data.frame(a = .) %>%
  separate(., a, c("sex", "age"))
sex.age.variable


file.load <- function(i) {
  read_excel(path = filename.list[i],
             sheet = "【ﾃｷｽﾄ】",
             skip = 0) %>% filter(!is.na(順位))
}

file.load(1)

i=3

read_excel(path = filename.list[i],
           sheet = "【ﾃｷｽﾄ】",
           skip = 0) %>% filter(!is.na(順位))



sex.age <- function(i) {
  file.load(i) %>% mutate(sex = sex.age.variable$sex[i],
                     age = sex.age.variable$age[i]) %>% select(age, sex, everything())
  
}

koubai<-map_df(1:12, sex.age) 

koubai %>% select(matches("額"))
