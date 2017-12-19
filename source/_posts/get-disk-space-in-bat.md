---
title: 通过批处理查看磁盘的可用空间
date: 2017-12-19 22:36:12
tags: bat
categories: Accessories
---

吐槽一下CSDN，虽然我不是一个活跃用户，但是好歹我也早就注册了，消息中心里边一堆2015年甚至更早的消息，然而今天想要在技术问答中回答一个问题的时候，好容易编辑好答案了，一点“我要回答”之后，提示“新注册用户3天内不能再问答频道回答”，然后编辑好的答案也没了，窝火。

<!--more-->

说正题，问题是：

>利用bat文件，显示
> C盘总容量；
> 总容量减去100G以后的容量；
> 第二步剩余容量平均分成两份之后每一份的容量。
> 均以MB显示。

## 解决方法：

首先，批处理确实可以获得某一分区的磁盘空间，包括可用空间以及剩余空间，但是是以字节为单位的。

第二，当使用批处理进行数学运算时，所能处理的最大数字是`2^31-1`，具体可以用下面的批处理脚本尝试：
```
@echo off
set /a abc=2147483648+1
echo %abc%
pause
```

而`2^31-1`，即`2,147,483,647`，如果将其看作是以字节为单位的容量值的话，换算成GB也就是2GB左右。
基于以上事实，对于主流的硬盘分区空间，批处理可以精确的获取其字节容量，但是并不能精确的转化为MB或者GB。

虽然如此，在获取到字节容量后，可以通过截取其中特定位数，将字节容量近似的转化为GB或者MB。

例如，如果字节容量为：`2,147,483,647`，要将其转化为GB，只需要将小数点左移9位，相当于做`/1000/1000/1000`运算，然后舍去小数点右侧的值，即可得到`2GB`。

基于这种算法的批处理脚本：
```
@echo off
setlocal enabledelayedexpansion
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk c: get Size/value') do set tsize=%%a
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk c: get FreeSpace/value') do set fsize=%%a
set gbtsize=%tsize:~0,-7%
set gbfsize=%fsize:~0,-7%
set /a newtsize = %gbtsize%-102400
set /a rsize = %newtsize%/2

:cut1
set pa=!gbtsize:~-3!
if "!gbtsize!"=="" (goto cut2)
set pa1=!pa!,!pa1!
set gbtsize=!gbtsize:~0,-3!
goto cut1

:cut2
set pb=!newtsize:~-3!
if "!newtsize!"=="" (goto cut3)
set pb1=!pb!,!pb1!
set newtsize=!newtsize:~0,-3!
goto cut2

:cut3
set pc=!rsize:~-3!
if "!rsize!"=="" (goto output)
set pc1=!pc!,!pc1!
set rsize=!rsize:~0,-3!
goto cut3

:output
echo Total Size of Drive C: !pa1:~0,-1! MB
echo Remaining Size after 100G: !pb1:~0,-1! MB
echo Half of Remaining Size: !pc1:~0,-1! MB
pause
```
