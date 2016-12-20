---
title: shell脚本入门之四 - 其它判断
date: 2016-12-20 10:52:56
tags: Linux
categories: Linux
---

## `&&`和`||`

除了使用`if`以外，在shell中还可以使用`&&`和`||`来执行判断。

<!--more-->

### 基本含义`&&`

`&&`本身表示“和”（AND）预算，语法格式为：

```bash
command1 && command2
```

表示：当且仅当`command1`的返回结果为真时，执行`command2`。

### 举例

如果当前用户不是superuser，退出执行：

```bash
#!/bin/sh

[ ! $(id -u) -eq "0" ] && {read -p "You are no the superuser. Hit [Enter] to exit." enter; exit 1;}
```

`read -p`：`read`命令是用来接收用户输入的，`-p`会在用户输入之前显示一条提示语句。

`{}`：用来将两个命令组合到一起，两个命令之间用`;`分隔。

### 基本含义`||`

`||`本身表示“或”（OR）预算，语法格式为：

```bash
command1 || command2
```

表示：当且仅当`command1`的返回结果不为真（non-zero exit status）时，执行`command2`，若`command1`返回结果为真，则不执行`command2`，换句话说就是：要么成功的执行`command1`，要么就执行`command2`。

### 举例

如果当前用户不是superuser，提示用户：

```bash
#!/bin/sh

[ $(id -u) -eq "0" ] || echo "You are not the superuser."
```

### `&&`和`||`一起用

判断当前用户，并根据情况提示不同的语句：

```bash
[ $(id -u) -eq "0" ] && echo "You are the superuser." || echo "You are not the superuser."
```

## `case`

用来匹配字符串，根据不同的字符串执行不同的命令，基本语法格式：
```bash
case $variable-name in
  pattern1)
    command1
    command2
    ...
    commandN
    ;;
  pattern2)
    command1
    command2
    ...
    commandN
    ;;
esac
```

例如：根据不同的人名返回不同的年龄，创建一个`age.sh`文件并写入如下内容：

```bash
#!/bin/sh

# if no name provided, set pname to blank.
if [ -z $1]; then
  pname="blank"
else
  pname=$1
fi

case $pname in
  "rick") echo "Rick is 20 years old.";;
  "angel") echo "Angel is 18 years old.";;
  "david") echo "David is 22 years old.";;
  "blank") echo "You provided a blank name";;
  *) echo "Sorry, i don't know the age for $rental.";;
```

然后分别在终端输入以下命令：
```bash
$ sh age.sh
$ sh age.sh rick
$ sh age.sh angel
$ sh age.sh petter
```

得到的输出依次如下：
```bash
You provided a blank name
Rick is 20 years old.
Angel is 18 years old.
Sorry, i don't know the age for petter
```

 - `$1`：表示传入shell的第一个参数
 - `*)`：表示除了前面所列出的其它的任何情况。
