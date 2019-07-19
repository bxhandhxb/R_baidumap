#author: baiyunyu, liqianqian
#date: 2019.7.17
library(ggplot2)
library(baidumap)
library(ggmap)

options(baidumap.key="2OBdehyusfGE2KRAvik4jhzb0gQ1VgfA")  #用密钥打开百度map的包
setwd("/Users/yunyubai/Desktop")
dizhi<-read.csv('6yue.csv')
a<-paste("上海市",dizhi$danwei,sep="")
b<-getCoordinate(a,formatted=T)#获取经纬度
d<-data.frame(b)
visit.x<-d$longtitude
visit.y<-d$latitude
#centerx=(min(visit.x)+max(visit.x))/2     #经度中心
#centery=(min(visit.y)+max(visit.y))/2     #纬度中心
#因为有的经纬度没有查出来(可能是响应慢了)，是NA，导致不能直接用min，max；下图的location是估算的精度和维度
mp<-getBaiduMap(location = c(121.53, 31.22), width = 800, height = 800, zoom = 13, scale=2,
            color = "color", messaging = TRUE) # 返回ggmap对象
#在网页上width height 最高是1000，但代码里似乎900就下载不下来了，表示地图图片的高宽； zoom最大是21，表示地图放缩的程度，
#越大，表示精度越高，默认是10；scale似乎没有什么用，就用的2
mp<-ggmap(mp)
mp2<-mp+geom_point(aes(x=visit.x,y=visit.y),color="darkorange",data=d)+scale_size(range=c(1,1))
#绘制带点的地图，geom_point是在地图上绘制点，x轴为经度信息，y轴为纬度信息，color为暗桔色，scale_size是将点变大一些
mp3<-mp2+theme(legend.position = "none") #将图例去掉
mp3