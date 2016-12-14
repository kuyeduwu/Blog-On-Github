---
title: 将Hexo源文件放在GitHub上
date: 2016-12-13 10:01:25
tags: Git
categories: Accessories
---

## 起因

因为工作的关系，公司对电脑的使用限制的比较严格，不可能在公司电脑上安装Hexo；同时，在公司的时候可能随时会冒出来一些想法或者看到一些资料，需要用Hexo写下来，这就让人比较蛋痛了。

<!--more-->

好在自己有VPS，而且提供了基于网页的`Console`，可以在VPS上安装Hexo，远程操作。

但是新问题又来了：

1. Hexo关于博客的设置，包括主题什么的都是存在本地的，如果我在VPS上更改了Hexo的设置或者主题，在家里电脑上再次`generate`的话就会把VPS上的设置覆盖掉。
2. VPS上基于网页的`Console`对中文十分不友好，无论是写中文内容还是操作和中文有关的设置，都会是一场悲剧。

基于上面这些蛋疼（没事找抽）的需求，才有了这么一个疯狂的想法：把Hexo源文件放在GitHub上。

## 愿景

把Hexo源文件放在GitHub上基本上能满足以下需求：

1. VPS上的Hexo和家里电脑上的Hexo文件能始终保持同步，从而避免出现设置相互覆盖的问题。
2. 如果是通过VPS建立的新文章，在执行完`hexo new`之后，可以`push`到GitHub上，从而实现在GitHub上编辑正文内容，避免了在网页版`Console`中编辑中文的尴尬。

## 折腾

### VPS端

#### 第一步：在VPS上安装Git

1. Ubuntu执行`sudo apt-get install git-core`
2. Fedora执行`sudo dnf install git-core`
3. Red Hat, CentOS执行`sudo yum install git-core`

#### 第二步：通过nvm安装Node.js

1. `$ curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh`
2. 重启终端
3. `$nvm install stable`
  
#### 第三步：安装Hexo，并且在`<hexo-files>`文件夹中初始化

1. `$ npm install -g hexo-cli`
2. `$ hexo init /home/your user name/hexo-files`
3. `$ cd /home/your user name/hexo-files`
4. `$ npm install`
  
#### 第四步：根据自己的需求更改Hexo的设置

1. 安装`hexo-deployer-git`: `$ npm install hexo-deployer-git`
2. 设置站点名称等其他设置，这里请参考Hexo官方文档中关于`_config.yml`的部分。
3. 设置主题

    这里应当注意，很多Hexo主题都是托管在GitHub上的，在安装主题的时候大多会是通过`git clone`命令将主题文件克隆到Hexo的`themes`文件夹下。

    如果是在本地管理Hexo，没有任何问题，但是对于我这个奇（变）葩（态）的需求来说，会产生严重问题：

    我们需要将整个`<hexo-files>`目录下的所有文件和子目录作为一个`repo`放到GitHub上，而通过`git clone`命令会自动把所下载的主题作为一个`repo`放在`themes`文件夹下，这样就导致在我们自己的`repo`下有一个属于别人的子`repo`，当`push`到GitHub上以后，在GitHub上，子`repo`中的内容会显示为一个灰色的文件夹，其中的内容不可见。

  为了避免这种情况，我们需要使用`wget`或者是`curl`命令，手动下载主题的`zip`或者`tar.gz`文件，然后手动解压到`<hexo-files>`中的`themes`文件夹下。

#### 第五步：设置Git所使用的用户名和邮箱：

1. `$ git config --global user.email "you@example.com"`
2. `$ git config --global user.name "Your Name"`

#### 第六步：在GitHub上创建新的的`repository`并且得到该`repo`的`https`地址

#### 第七步：将`<hexo-files>`中的所有文件关联到GitHub

在`<hexo-files>`目录中执行如下命令：

1. `$ git init`
2. `$ git add *.*`
3. `$ git commit -m "Create hexo files."`
4. `$ git remote add origin "第六步得到的地址"`
5. `$ git pull origin master`
6. `$ git push -u origin master`，之后会提示输入GitHub的账号和密码。
