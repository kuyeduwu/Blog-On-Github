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

这里其实存在一个先后顺序，如果先配置VPS端的话，后续在个人电脑端配置的时候就需要用已经`push`到GitHub上的Hexo内容替换本地电脑上的Hexo内容，同理，如果是先配置个人电脑端的话，在VPS端就需要用已经`push`到GitHub上的Hexo内容替换VPS本地电脑上的Hexo内容。

#### 第一步：在VPS上安装Git

```bash
sudo apt-get install git-core #Ubuntu系统
sudo dnf install git-core #Fedora系统
sudo yum install git-core #Red Hat, CentOS系统
```

#### 第二步：通过nvm安装Node.js

```bash
$ curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
```
重启终端后执行：
```bash
$ nvm install stable
```
  
#### 第三步：安装Hexo，并且在`<hexo-files>`文件夹中初始化

```bash
$ npm install -g hexo-cli
$ hexo init /home/your user name/hexo-files
$ cd /home/your user name/hexo-files
$ npm install
```
  
#### 第四步：根据自己的需求更改Hexo的设置

```bash
$ npm install hexo-deployer-git #安装hexo-deployer-git
```
设置站点名称等其他设置，这里请参考Hexo官方文档中关于`_config.yml`的部分。

设置主题的时候应当注意，很多Hexo主题都是托管在GitHub上的，在安装主题的时候大多会是通过`git clone`命令将主题文件克隆到Hexo的`themes`文件夹下。

如果是在本地管理Hexo，没有任何问题，但是对于我这个奇（变）葩（态）的需求来说，会产生严重问题：

我们需要将整个`<hexo-files>`目录下的所有文件和子目录作为一个`repo`放到GitHub上，而通过`git clone`命令会自动把所下载的主题作为一个`repo`放在`themes`文件夹下，这样就导致在我们自己的`repo`下有一个属于别人的子`repo`，当`push`到GitHub上以后，在GitHub上，子`repo`中的内容会显示为一个灰色的文件夹，其中的内容不可见。

为了避免这种情况，我们需要使用`wget`或者是`curl`命令，手动下载主题的`zip`或者`tar.gz`文件，然后手动解压到`<hexo-files>`中的`themes`文件夹下。

#### 第五步：设置Git所使用的用户名和邮箱：

```bash
$ git config --global user.email "you@example.com"
$ git config --global user.name "Your Name"
```

#### 第六步：在GitHub上创建新的的`repository`并且得到该`repo`的`https`地址

#### 第七步：将`<hexo-files>`中的所有文件关联到GitHub

在`<hexo-files>`目录中执行如下命令：

```bash
$ git init
$ git add *.*
$ git commit -m "Create hexo files."
$ git remote add origin "第六步得到的地址"
$ git pull origin master
$ git push -u origin master #之后会提示输入GitHub的账号和密码
```

### 个人电脑端

#### 第一步：重复上面前三步，安装好Git和Hexo，并且通过`hexo init`初始化到文件夹`<hexo-files>`中。

#### 第二步：在`<hexo-files>`文件夹中初始化Git

```bash
$ git init
$ git add .
$ git remote add origin "GitHub远程仓库的地址，即是前面第六步得到的地址"
```

#### 第三步：用GitHub上的内容替换掉本地内容

```bash
$ git reset --hard origin/master
$ git pull origin master
```

## 使用

### 发文章

#### VPS

正常来讲，通过Hexo发布一篇新文章需要通过`hexo new post post-title`命令，这条命令会自动在`<hexo-files>`下的`<_source/_posts>`目录下新建一个名为`post-title.md`的文件，这个文件内的MarkDown格式的内容就是文章的正文内容。

实际上，在这一步，Hexo除了帮我们创建一个文件以外，并没有做其它额外的操作，而且事实证明，在`<_source/_posts>`目录下，即便是自己手动创建的`.md`文件，也可以被`hexo generate`命令识别。

所以，我们可以直接在GitHub上，在`<_source/_posts>`目录下，手动建立一个`.md`文件，并且使用Markdown格式完成正文内容，然后再回到VPS：

```bash
$ git pull origin master #把新建的Markdown文件拿到本地
$ hexo generate
$ hexo deploy
```

Hexo执行完`generate`和`deploy`命令之后，对`<hexo-files>`目录下的文件并不会有任何改动，这一点可以通过`git status`命令确认，所以也就不需要再执行`git push`。

#### 个人电脑

在个人电脑上，我们有自己喜欢的文本编辑器，并且也不存在中文支持问题，所以完全可以在本地编辑文章，只不过要记得编辑完之后要使用`push`命令，因为我们手动改变了`<hexo-files>`内的内容，要把更改同步到GitHub以使GitHub上内容始终是最新的。

```bash
$ git pull origin master #更新本地文件确保和GitHub上保持同步
$ hexo new post "My Post" #新建一篇博文
#使用自己喜欢的文本编辑器完成"My Post.md"
$ hexo generate
$ hexo deploy
$ git add . #将新建立的文件纳入Git的监视
$ git commit -m "Create My Post" #提交更改
$ git push -u origin master #之后会提示输入GitHub的账号和密码
```

### 发布新页面

与发文章类似，不同在于`hexo new page page_name`命令将在`<source>`目录下创建一个名为`<page_name>`的子目录，并在该子目录下建立一个名为`index.md`的文件，如果是在GitHub上手动创建的话，不要忘记将页面的名字作为子目录的名字，而页面的内容放在子目录下的`index.md`文件中。

## 总结

其实Hexo本身已经是一个很优秀的博客程序，也足够方便，可是总会有一些像我这样的人会有一些奇（没）奇（事）怪（找）怪（抽）的需求，本着不折腾会死的精神，尝试了这么一套解决方法，现在用起来还算是比较顺手，只不过需要来回的敲那些命令，不过好在Linux上有个东西叫做shell脚本。

以后终于可以随时随地开开心心的Hexo了。
