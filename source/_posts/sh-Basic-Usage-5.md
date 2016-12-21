---
title: shell脚本入门之五 - 循环 - select
date: 2016-12-21 20:51:01
tags: Linux
categories: Linux
---

其实很多编程语言中都有类似于`select`的语句，譬如说`vb`中就有`select case`，只不过更多的偏向于判断的功能，在shell中的`select`则更多的偏向于循环的功能。

<!--more-->

## 语法格式

```bash
#!/bin/bash

select 新变量名 in "选择项1" "选择项2" ... ; do #select开始
	commands1
	commands2
done #select结束

```

## 举个例子

```bash
#!/bin/bash

echo "Which is your favourite OS?"

select var in "Ubuntu" "Fedora" "Windows" "OS X"; do
	break
done

echo "You have selected ${var}."
```

运行结果：
![Select Result](/images/select-1.png)

## 解释

`select`命令做了如下操作：

1. 把`in`后面的内容自动用`1,2,3,4...`编号并列出菜单。
2. 列出菜单之后，自动等待输入——以`#?`为提示符。
3. 用户输入后，自动将相应变量赋值给`var`。
4. `break`的作用在于：一旦用户作出了选择就跳出`select`循环，如果没有`break`，在每次显示"You have selected ..."之后会再次让用户选择，并一直循环下去。

## `select`命令配合`case`命令：

```bash
#!/bin/bash

echo "What is your favourite OS?"

select var in "Ubuntu" "Fedora" "Windows" "OS X" "Red Hat"; do
	case $var in
		"Ubuntu"|"Fedora"|"Red Hat")
			echo "You selected Linux.";;
		"Windows")
			echo "You selected Microsoft.";;
		"OS X")
			echo "You selected Apple.";;
		*)
			echo "Invalid selection.";;
	esac
	break
done
		
```

运行结果：
![运行结果](/images/select-2.png)

## 注意

`select`命令是bash的扩展应用，这意味着：
1. 脚本文件的第一行如果是`#!/bin/sh`，可能无法工作，应改为`#!/bin/bash`。
2. 如果使用`sh tst.sh`命令执行脚本文件，无法工作，错误提示：`select: not found`，应使用`. tst.sh`或者`bash tst.sh`执行。



