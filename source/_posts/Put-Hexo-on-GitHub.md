---
title: 将Hexo源文件放在GitHub上
date: 2016-12-13 10:01:25
tags: Git
categories: Accessories
---

## 起因

因为工作的关系，公司对电脑的使用限制的比较严格，不可能在公司电脑上安装Hexo；同时，在公司的时候可能随时会冒出来一些想法或者看到一些资料，需要用Hexo写下来，这就让人比较蛋痛了。

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

#### VPS端

1. 在VPS上安装Hexo，并且在`<hexo-files>`文件中初始化。
2. 根据需求更改Hexo的设置。
3. 在VPS上安装Git
   - Ubuntu执行`apt-get install git-core`
   - Fedora执行`dnf install git-core`
4. 设置Git所使用的用户名和邮箱：

```git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

5. 进入`<hexo-files>`文件夹，执行`git init`
6. 将所有文件
