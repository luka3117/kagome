suppressMessages(library(readxl))
suppressMessages(library(dplyr))
suppressMessages(library(tidyverse))


setwd("/Users/jclee/Dropbox/[0000]マクロミル/DS2回生プログラミングコンテスト資料/DS2回生プログラミングコンテスト資料/07_カゴメ部門(FIX)/分析用データ/消費者購買履歴データ/02_QPRデータ/04_アイテムランキング/変数名変換")
dir(pattern = "ranking")

filename.list<-dir(pattern = "ranking")[-c(7)]

filename.list

name <- function(i) {
  read_excel(
    path = filename.list[i],
    sheet = "【ﾃｷｽﾄ】",
    skip =0 
  ) %>% filter(!is.na(順位))
  
}



grep(pattern = "トマト調味料アイテムランキング",filename.list)

gsub("トマト調味料アイテムランキング","",filename.list) %>%
  gsub("_ranking2_","",.) %>% 
  gsub("xls","",.) %>% 
  gsub("\\d{7}","",.) %>% 
  gsub("\\(|\\)","",.) %>% 
  gsub("\\.","",.) %>% 
  gsub("性","性.",.) %>% data.frame(a=.)  
  






separate(filename.list)

name(1)



map(1:10, ~name(.x))



mapply(name, list(1:10))

name(1)

name(1) %>% dim()
name(2) %>% dim():10
name(3) %>% dim()
name(4) %>% dim()
name(5) %>% dim()
name(6) %>% dim()



for (i in 1:8) {
  name(1) %>% dim() %>% print()
i
  }






separate(
  data = aaa,
  col = a,
  into = sprintf("%s%d", "x", 1:7)
)





%>% separate(data = ., col = )





name(1) %>% colnames()

name(1) %>% mutate(age=10, sex="F") %>% select(age, sex, everything()) %>% dim()
name(2) %>% mutate(age=10, sex="F") %>% select(age, sex, everything()) %>% dim()



read_excel(
  path = filename.list[1],
  sheet = "【ﾃｷｽﾄ】",
  skip = 1
  ) %>% filter(!is.na(順位))



# tt<-
#   
#   
# read_xls(path = filename.list[7], sheet = "【ﾃｷｽﾄ】", skip =12, col_names =T)
# 
# ?read_xls
# 
# ()
# 
# tt %>%  colnames()
# 
# tt %>% select(メーカー...5, メーカー...6)
# tt %>% select(...15,...16)
# 
# tt %>% select(contains("..."))
# 
# 
# 
# 
# tt$メーカー...6
# dir()
# read_excel(path = "/Users/jclee/Dropbox/[0000]マクロミル/DS2回生プログラミングコンテスト資料/DS2回生プログラミングコンテスト資料/07_カゴメ部門(FIX)/分析用データ/消費者購買履歴データ/02_QPRデータ/04_アイテムランキング/トマト調味料アイテムランキング(女性10代)_ranking2_2650591.xls" ,
#            sheet = "金額", skip = 12) %>% filter(!is.na(順位)) %>% mutate(age="10代") %>% select(age, everything())
#                                                
# read_excel(path = "/Users/jclee/Dropbox/[0000]マクロミル/DS2回生プログラミングコンテスト資料/DS2回生プログラミングコンテスト資料/07_カゴメ部門(FIX)/分析用データ/消費者購買履歴データ/02_QPRデータ/04_アイテムランキング/トマト調味料アイテムランキング(女性10代)_ranking2_2650591.xls" ,
#            sheet = "金額", skip = 12) %>% filter(!is.na(順位)) %>% mutate(age="10代") %>% select(age, everything())
# 
# 
# 
# 
# 順位	アイテム	JANコード	枝番	メーカー	データ種別	カテゴリー大	容量レンジ	ブランド	ブランド詳細	"100人あたり
# 
# 購入金額"	"購入者あたり
# 
# 購入金額"	平均価格	購入率	"金額
# 
# シェア"	"累積
# シェア"	スーパー	コンビニエンスストア	一般小売店	百貨店	薬粧店・ドラッグストア	自動販売機	通信販売	訪問販売・宅配	ホームセンター、ディスカウントストア	駅売店	その他購入先
# 
# 
