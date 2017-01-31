---
title: shell脚本入门之三 - 判断
date: 2016-12-19 10:18:25
tags: Linux
categories: Linux
---

## if语句

if语句根据不同的条件执行不同的命令，有三种不同的形式，不过都是以`if`开始，以`fi`结束：

<!--more-->

```bash
# 形式一
if condition ; then
  commands
fi

# 形式二
if condition ; then
  commands1
else
  commands2
fi

# 形式三
if condition1 ; then
  commands1
elfi condition2 ; then
  commands2
fi
```

在第一种形式中，如果`condition`的结果为真，则执行`commands`，否则不执行任何操作。

在第二种形式中，如果`condition`的结果为真，则执行`commands1`，否则执行`commands2`。

在第三种形式中，如果`condition1`的结果为真，则执行`commands1`，否则判断`condition2`，如果结果为真，则执行`commands2`，否则不执行任何操作。

### 关于`condition`

先举个栗子，如果我们在C语言中要判断一个变量是不是大于100，可能会直接写`if ( a > 100 )`，直接用数学表达式来表示条件，可是在shell当中，事情变得有些不一样。

#### `test`命令

在shell的`condition`中，需要用`test`命令来获取`condition`的结果，`test`命令有两种形式：

```bash
# 形式一
test expression

# 形式二
[ expression ]
```

一般在`if`语句中，比较多的采用形式二，需要注意的是，在`[`后面一定要跟一个空格，在`]`前面也需要有一个空格。

#### 比较运算

shell中的比较运算也与C语言等编译型语言有些不同：

1. 字符串比较：
 - 内容相同 - `stra = strb`
 - 内容不同 - `stra != strb`
 - 字符串长度不为零 - `-n str`
 - 字符串长度为零 - `-z str`
 
2. 数字比较
 - 相等 - `int1 -eq int2`
 - 不等 - `int1 -ne int2`
 - 大于 - `int1 -gt int2`
 - 小于 - `int1 -lt int2`
 - 大于等于 - `int1 -ge int2`
 - 小于等于 - `int1 -le int2`
 
 #### 结论
 
 综上所述，在shell中如果要执行类似C语言中`if ( a > 100 )`的判断，应当写作`if [ $a -gt "100" ]`。
 
 一个完整的判断变量大小的shell脚本：
 ```bash
 #!/bin/sh
 
 a=50
 if [ $a -gt "100" ];then
  echo "a is greater than 100"
 else
  echo "a is not greater than 100"
 fi
 ```
 
 ### 一些其它判断
 
 #### 关于文件的判断
 
  - `-d file` - 判断是否是目录
  - `-e file` - 判断文件是否存在
  - `-f file` - 判断文件是否存在并且是正规文件
  - `-L file` - 判断文件是否为链接
  - `-r file` - 判断文件是否对当前用户可读
  - `-w file` - 判断文件是否对当前用户可写
  - `-x file` - 判断文件是否对当前用户可执行
  - `file1 -nt file2` - 判断file1是否比file2新
  - `file2 -ot file2` - 判断file1是否比file2旧
 
 例如，判断`/etc/`目录下是否存在`shadow`文件：
 
 ```bash
 #!/bin/sh
 
 if [ if "/etc/shadow" ]; then
    echo "shadow file exists."
 else
    echo "no shadow file."
 fi
 ```
 
 #### 判断是否超级用户
 
 ```bash
 #!/bin/sh
 
 if [ $(id -u) != "0" ]; then
    echo "You are not the superuser."
 else
    echo "You are the superuser."
 fi
 ```
