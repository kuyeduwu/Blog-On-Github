---
title: shell脚本入门之一 - 基础
date: 2016-12-14 14:54:25
tags: Linux
categories: Linux
---

## 执行

如果有一个sh文件：test.sh，只需要执行命令：
```bash
$ sh test.sh
```
<!--more-->

如果文件不能被执行，可以先执行`chmod +x`命令，再运行：
```bash
$ chmod +x test.sh
$ sh test.sh
```

## 阅读

使用你最喜欢的文本编辑器打开shell脚本。

### 第一行

第一行一般是：
```bash
#!/bin/sh
```

\#!后面的内容指定了使用`/bin/sh`来执行该脚本中的内容。

### 注释

shell脚本中使用\#用来表示注释，所有以\#开头的内容都不会被执行。

### 符号

shell脚本中比较常见的是`$`，用来表示对变量的引用。

## 编写

sh文件的开头第一行必须要类似于：
```bash
#!/bin/sh
```
实际的sh脚本中，第一行一般有如下两种：
```bash
#!/bin/sh
#!/bin/bash
```
二者的区别不在本文的讨论之列，对于菜鸟级别的基础使用，两种都是可以的。

*第一行其实有个名字，叫做：shebang，来源于 sharp(#) + bang(!)*
