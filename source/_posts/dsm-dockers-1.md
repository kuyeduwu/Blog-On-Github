---
title: 群晖必备Docker镜像：Heimdall
date: 2021-12-01 23:46:59
tags: [群晖,NAS,Synology,docker]
categories: NAS
---

给家庭网络中所有的服务一个统一的入口。

<!--more-->

在开始搭建家庭网络之后，用到的服务越来越多，不同的服务往往或许地址不一样，或许端口不一样，一些不常打开的静默服务，例如OpenWRT，时间一长可能就忘记地址了。

针对这种情况，或者可以用浏览器书签解决，或者可以直接登录主路由后台，查看客户端IP，但是，理应有一种更优雅的方式。

# Heimdall

[Heimdall](https://heimdall.site/)可以简单理解为一个导航页，但是比早些年Hao123之类的要优雅许多。
![Heimdall](/images/heimdall.png)

## 安装

1. 确保群晖中Docker已经安装并启用。
2. 打开Docker应用，在"Registry"中搜索"Heimdall"。
3. 在搜索结果中找到"linuxserver/heimdall"，点击下载。
![Heimdall-install](/images/heimdall-docker.png)

## 启动

1. 下载完成后，在"Image"菜单下找到下载好的镜像，点击"Launch"。
2. 在弹出的设置窗口中点击"Advanced Settings"。
3. 在弹出的"Advanced Settings"窗口中，点击"Port Settings"。
4. 在"Local Port"中，把Auto改为其它数值，从而避免潜在的端口冲突，例如：444，81。
![Heimdall-port](/images/Heimdall-port.png)
5. 其它设置可以保持默认，确定之后，去到Docker应用的"Container"菜单下，应该可以看到一个正在运行的容器。

## 配置

容器启动成功后，通过浏览器访问群晖的IP地址和刚刚设置的端口号，例如`http://192.168.1.3:81`就可以访问到Heimdall页面。

1. 点击Heimdall页面右下角的"Items"菜单，可以管理所有的导航项目。
![Heimdall-items](/images/heimdall-items.png)
2. 打开"Items"菜单之后，点击右上角的"Add"，从而添加一个新的项目。
    - Application Name：在导航页上显示的名字。
    - Application Type：常见的应用基本都可以从这个列表找到，选择好后会自动应用对应的图标和背景色。
    - Colour：如果对背景色不满意可以自己设置。
    - URL：该应用的地址，需要带着开头的`http`或者`https`。
    - 打开右上角的"PINNED"开关，从而确保添加的项目会固定在主页
3. 填写完毕之后点击右上角的"SAVE"。
![Heimdall-add-item](/images/heimdall-add-item.png)

## 优势

通过Heimdall可以把家庭网络中所有的服务集中在一个比较优雅的导航页中，从而实现一键直达。
最终效果：
![Heimdall-preview](/images/heimdall-preview.png)

## 其它

Heimdall不止可以聚合家庭网络内部的服务，也可以加入一些外部的地址，以及还有一些其它的可定制功能，可以实现一个完美的个人导航页。