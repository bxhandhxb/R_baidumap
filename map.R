#author: baiyunyu, liqianqian
#date: 2019.7.17
library(ggplot2)
library(baidumap)
library(REmap)

options(baidumap.key="2OBdehyusfGE2KRAvik4jhzb0gQ1VgfA")  #用密钥打开百度map的包
setwd("/Users/yunyubai/Desktop")
dizhi<-read.csv('5yue.csv')
a<-paste("上海市",dizhi$danwei,sep="")

geodata = data.frame(lon = dizhi$longtitude,
                     lat = dizhi$latitude,
                     city = a)

res=remapB(markPointData = data.frame(geodata$city),
       geoData = geodata,
       markPointTheme = markPointControl(effect = F,symbol = "pin",
                                         symbolSize = 5,
                                         color="red"),
       title="浦东企业分布")