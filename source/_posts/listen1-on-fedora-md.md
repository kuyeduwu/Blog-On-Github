---
layout: posts
title: Fedora安装Listen1
date: 2017-02-11 16:07:31
tags: Fedora
categories: Linux
---

## 神器

在GitHub上偶然发现一个针对国内在线音乐平台的一个神器：Listen1，项目地址：[GitHub](https://github.com/listen1/listen1_desktop)

此神器的之所以被称为神器，原因有二：
1. 同时提供网易云音乐，虾米，QQ音乐三家的曲库。
2. 有Linux客户端。

其实一直以来就很喜欢网易云音乐，曲库也算比较全，但是无奈有个别歌曲只有虾米上有，所以也一直因为这个事头疼了好久，而对QQ音乐一直无感。

既然Listen1在一个应用内同时网易和虾米，果断要收入囊中。

## 遗憾

Listen1提供了Chrome和Firefox的插件，提供了Win，Mac的客户端，也提供了Linux的客户端，但Linux上是Deb安装包，这家伙在Fedora上就有点水土不服了。

## 解决

Linux上本身也有一个神器，叫做`alien`，可以将Debian/Ubuntu的Deb包转化成RedHat/Fedora下可用的RPM包，然而未必一定能成功。

当我尝试将Listen1的Deb包通过`alien`转化成RPM包的时候，果然不出意料的失败了。

换备用方案：Listen1是基于Electron编写的，打包的Deb包也是通过Electron完成的，既然如此，我们可以`clone`源码后，重新用Electron打包一个RPM包就完美了。

## 步骤

1. 安装`rpmbuild`:`$ sudo dnf install rpm-build`
2. 安装`electron-installer-redhat`: `$ npm install --save-dev electron-installer-redhat`
3. 修改Listen1的`package.json`：
  - 第24行，`devDependencies`下添加：`"electron-installer-redhat": "*"`
  - 第47行，`scripts`下添加:`"dist:rpm64": "electron-packager . listen1 --platform linux --arch x64 --name='Listen 1' --version='1.0.1' --out dist/; electron-installer-redhat --src dist/listen1-linux-x64/ --dest dist/installers/ --arch x86_64"`
4. 在Listen1根目录下执行`$ npm run dist:rpm64`
5. 稍等片刻就会在`dist/installer/`目录下生成RPM包。
6. 此时就可以愉快的使用`$ sudo dnf install listen1*.rpm`了。

## 已知Bug

我目前的桌面环境是Fedora 25 with KDE Plasma 5.8.5，在此环境下，按照上述步骤安装Listen1之后存在的Bug为：

 - KDE应用程序启动器中存在Listen1的图标，但是点击后无法启动Listen1，提示“找不到应用程序Listen1”

 通过运行以下命令解决：
 `$ sudo ln -s /usr/share/Listen1/listen1 /usr/bin/Listen1`
