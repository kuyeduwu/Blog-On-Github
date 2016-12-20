---
title: 用Ubuntu自带播放器Rhythmbox收听iTunes播客
date: 2016-12-20 21:58:25
tags: Ubuntu
categories: Accessories
---

## 起因

众所周知，苹果播客里面有很多优秀的或者是很有意思的内容，有苹果手机的话，想听这些播客内容当然很方便；如果要是开电脑的话，无论是Windows还是Mac，都有iTunes可以用，也可以同步手机里的播客内容；但是，如果你的电脑像我一样是Ubuntu怎么办？

<!--more-->

## 软件选择

其实既然选择了Ubuntu系统，娱乐功能自然是居于次要地位的，所以说如果能用系统自带软件解决的话，自然是最好的。

Ubuntu自带的关于音乐的软件叫做Rhythmbox，其实我一直没搞明白这个东西的英文发音到底是什么，不过也无所谓了，反正只要是支持播客订阅就好了。

## 步骤

想在其他客户端上收听播客内容的话，需要先知道这个播客的真实地址，好在iTunes播客的真实地址并不难获取。

1. 打开iTunes客户端，进入到已订阅的播客列表。
![iTunes](/images/iTunes.jpg)
2. 在某一个播客的图标上右击，选择“Copy Podcast URL”。
![iTunes-Right-Click](/images/iTunes-right-click.jpg)
3. 至于说这个地址怎么拿到Ubuntu系统上就见仁见智了，你可以开一个FTP，你可以用iCloud的同步功能，甚至可以用网页版微信。
4. 回到Ubuntu，打开Rhythmbox。
5. 点击左侧的“Podcasts”，然后点击右侧的“Add”
![Rhythmbox](/images/Rhythmbox.png)
6. 在搜索框中填入第2步获得的播客地址，然后点击“Search”。
7. 稍等片刻下面的列表中就会出现播客的名字和可订阅的剧集。
8. 点击“Search”旁边的“Subscribe”，从而把当前播客添加到订阅列表。
9. 最后点击“Subscribe”旁边的“Close”按钮，就会回到播客列表，现在就可以在Rhythmbox中收听播客了。
![Rhythmbox](/images/Rhythmbox-Add-Podcast.png)

## 存在的问题

1. 播放完当前剧集之后会自动停止播放，不会自动播放下一集。
2. Phythmbox毕竟还只是个音乐播放软件，视频播客是不能播放的。
