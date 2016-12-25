layout: posts
title: Ubuntu安装与配置记录
date: 2016-12-25 17:13:55
tags: Ubuntu
categories: Linux
---

前一段时间把自己的主力电脑从Win迁移到了Ubuntu，对中途所做的一些配置做简要记录，以为后续参考。

## 硬件平台

惠普G4-2318tx: i5-3210; 500GB HDD; 4GB RAM。

## 安装介质

500GB移动硬盘。

后来尝试在一款更老一些的笔记本上（主板不支持UEFI）安装，发现无法从移动硬盘识别到操作系统，此前用同样的方法在该笔记本上安装Win7是可以正常进行的。原因未作深究，找了一个更为简单的方法：使用Rufus将iso文件写入到一个U盘上。详细步骤参考：[How to create a bootable USB stick on Windows](https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows)

## 安装过程

安装过程网上已有太多教程及解读，不再废话。

## 安装完成

### 系统更新

```bash
$ sudo apt-get update
$ sudo apt-get upgrade
```

### 系统清理

Ubuntu自带了一系列的软件，但是有很多是基本上用不到的，虽说留着也占不了太多空间，但是作为一个强迫症患者，还是卸载了心里舒服：

```bash
$ sudo apt-get remove unity-webapps-common #删除启动器上的亚马逊
$ sudo apt-get remove simple-scan #Ubuntu自带的一个扫描程序
$ sudo apt-get remove gnome-mahjongg gnome-mines gnome-sudoku #Ubuntu自带的一些小游戏
$ sudo apt-get remove webbrowser-app #Ubuntu自带的一个简单的浏览器，图标巨丑，无奈这东西在安装Unity Tweak Tool的同时也会被装上
```

### 系统美化

清理干净之后离开始干活就不远了，无奈实在有点受不了Unity默认的主题样式，用惯了iOS之后觉得扁平相对于拟物虽然少了很多的细节，但是看起来干净，舒服是真的。

换主题之前，需要安装Unity Tweak Tool:
```bash
$ sudo apt-get install unity-tweak-tool
```

#### 安装Flatabulous主题:

1. 点击[下载deb安装包](https://github.com/anmoljagetia/Flatabulous/releases/download/16.04.1/Flatabulous-Theme.deb)
2. 下载之后直接双击安装。

#### 安装图标包

一个好看的主题一定要有好看的图标相配套:
```bash
$ sudo add-apt-repository ppa:noobslab/icons
$ sudo apt-get update
$ sudo apt-get install ultra-flat-icons
```

#### 启用主题和图标

1. 打开Unity Tweak Tool。
2. 进入Themes。
![Unity Tweak Tool](/images/unity-tweak-tool.png)
3. 选择Flatabulous。
![Flatabulous](/images/utt-theme.png)
4. 切换到Icons。
5. 选择Ultra-flat。
![Ultra flat](/images/utt-icons.png)

#### 效果

![Screenshot](/images/screenshot.png)

### 工具安装

#### Dock

自从习惯了Mac上的Dock，便离不开这种东西，无奈以前Win7上表现良好的Rocket Dock在Win10上各种水土不服，好在Ubuntu上还是有好用的Dock的。

```bash
$ sudo apt-get install docky
```

效果图:

![Docky](/images/docky.png)

#### Chrome

先下载deb软件包，然后双击安装就可以了，虽说谷歌在国内是不能上的，但是下面的命令还是能执行的。

```bash
$ sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

安装完毕后：
1. 打开Settings->Advanced sync settings，选择Choose what to sync，然后把Themes前面的对勾取消。
2. 在Settings-> Appearance下，点击Use GTK+ theme，并且选中Use system title bar and border。


#### Spotify

虽然网易云音乐在国内来说还不错，但是听来听去也就是那几首歌，所谓的私人电台推荐的音乐也不全是符合自己口味的，反倒是Spotify上，经常能有惊喜，推荐的音乐也比较对口味。

Spotify安装方法，参考[官网链接](https://www.spotify.com/sg-en/download/linux/)：

```bash
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client
```

#### Pinta

类似Windows中的画图应用，主要用来处理简单的图片标注，可以通过Ubuntu自带的软件商店安装。

关于Ubuntu上其它的图片处理应用，可以参考另一篇文章：[Ubuntu下的图片编辑程序](http://kuyeduwu.github.io/2016/12/20/Image-Tools-On-Ubuntu/)

#### Sublime

Sublime对于我来讲属于：看了一眼之后便再也看不上其它编辑器。

安装方式也很简单，虽说有ppa可以用，但是还是习惯于去官网下载deb包，然后手动安装。

既然用Sublime，肯定少不了Package Control，参考[官网说明](https://packagecontrol.io/installation)进行安装。
