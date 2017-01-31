layout: posts
title: VBA简明教程之二 - VBA基础概念和宏的录制
date: 2016-12-23 23:28:01
tags: VBA
categories: Office Skill
---

## 示例文件
 
以下图为例，准备3份不同的Excel文件，分别命名为“2016 Revenues”，“2015 Revenues”和“2014 Revenues”。
 
每份文件只有B3:M5区域的数字不同，以及A1单元格内的标题内容不同，其它内容保持一致。

<!--more-->

![Sample Data](/images/sample-data.png)
 
## VBA
 
关于VBA的基础概念，需要知道以下几点：
 
1. VBA全称为：Visual Basic for Application，是以Visual Basic为基础的一种脚本语言。
2. VBA需要依附于微软办公套件（MS Office），并不独立存在。
3. 针对常用的MS Office四大件(Word, Excel, Outlook, Powerpoint)，VBA功能存在于Developer(开发者工具)菜单下。
	- 默认情况下，Developer菜单是不显示的，需要用户依次点击File，Options，进入Customize Ribbon(自定义功能区)设置，将Developer选中。此方法适用于MS Office2010及以上版本。
 
## 宏
 
所谓“宏”，其英文版原文为“Macro”，宏的实际内容就是一条一条自动生成的VBA语句。

在我们正式开始介绍VBA语句之前，可以将宏理解为一系列操作的集合，在运行宏的时候，实际上是按照顺序自动执行其中的所有操作。针对同样的操作步骤，宏自动执行的速度要远快于手动操作的速度。

正是由于宏可以自动生成VBA语句，在正式开始学习VBA之前，有必要了解一下宏的基本操作。

### 宏的录制
 
#### 开始录制
 
有两种方式可以开始宏的录制：
 
1. 通过点击Developer菜单下的**Record Macro**命令。
2. 直接点击Excel窗口左下角的**Record Macro**的图标：

![Record Macro](/images/record-macro.png)
 
#### 设置宏的基本信息
 
点击录制按钮之后会遇到一个窗口：
 
![Macro Description](/images/macro-description.png)

##### Macro name

为将要录制的宏提供一个名字，Excel中对宏的名字有如下要求：

1. 只能以字母作为开头。
2. 不能包括空格以及其他特殊符号。
3. 不能和Excel内置的一些公式名字或其它关键字冲突。
4. 不能为空。

##### Shortcut key

为将要录制的宏指定一个快捷键，只能使用字母，可以留空。

*注意：在设定快捷键的时候千万小心。因为默认的组合键是使用Ctrl+字母，所以很容易覆盖掉系统默认快捷键，譬如说，系统默认Ctrl+S是保存的快捷键，但是如果这里指定字母为“s”，那么Ctrl+S将不再执行保存功能，而是执行你所录制的宏。如果真的想在这里输入“s”的话，可以输入大写的“s”，从而使组合快捷键变为Ctrl+Shift+S，这个组合键曾经作为另存为的快捷键存在于2003版的Office当中，自2007版本开始便取消了，所以不用担心存在冲突。*

##### Store macro in

宏的存储位置，一般会提供三个选项:

1. This Workbook - 默认选项，将宏保存在当前工作簿中。
2. New Workbook - 将宏保存在一个新的工作簿中。
3. Personal Macro Workbook - 将宏保存在一个独立的工作簿中。

假设当前的工作簿的名字叫做**FileA**，宏的名字叫做**MacroA**，以此解释一下三个选项的区别：

1. 录制的宏直接保存在**FileA**当中，无论谁打开**FileA**都可以找到并运行**MacroA**。如果希望将**MacroA**用于其它文件，需要同时打开**FileA**。
2. 录制的宏保存在一个新的文件——**FileB**中，**FileA**中不存在任何关于**MacroA**的内容。如果希望在其它工作薄中运行**MacroA**，需要同时打开**FileB**。
3. 录制的宏保存在一个叫做“Personal Macro Workbook”的隐藏文件中，**FileA**中不存在任何关于**MacroA**的内容，只要在同一台电脑上，以后任何时候打开任何**任何Excel文件**，都可以运行**MacroA**。

##### Description

为将要录制的Macro提供一些描述，可以留空。

#### 录制进行中
 
设置完Macro name等基本信息，点击OK关闭“Record Macro”窗口之后，就已经进入录制状态，此时在Excel中的**大部分**操作都会被记录下来。
 
录制过程中并没有一个明确的状态指示，只有两点：
 
1. Developer菜单下的**Record Macro**命令变为**Stop Recording**。
2. Excel窗口左下角的**Record Macro**命令变为**Stop Recording**的图标。
 
#### 结束录制
 
点击**Stop Recording**按钮，即可结束录制。
 
### 宏的运行
 
点击Developer菜单下的**Macros**命令，即可看到此前已经录制的宏，选择任何一个，点击**Run**即可在当前工作簿中运行选中的宏。
 
### 带有宏的工作薄的保存
 
根据录制时所选择的存储位置的不同，在保存当前工作薄的时候会有不同的提示：
 
#### 宏保存在当前工作薄(This Workbook)

收到如下提示：

![Excel Message](/images/save-macro-warning.png)

原因在于从Office 2007开始，Excel不能在普通的工作簿中保存宏信息，如果需要保存宏信息，需要把工作薄的格式修改为Macro-Enabled Workbook(*.xlsm)。

在收到该提示时，如果点“Yes”，那么所录制的宏信息会丢失，只能够保存针对工作表内容的更改；如果要保留宏信息，需要点“No”，然后在弹出的“Save As”对话框中，将“Save as type”选择为Macro-Enabled Workbook。

#### 宏保存在新工作簿(New Workbook)

在保存当前工作簿时，不会有错误提示，可以正常保存，但是一定要注意要将储存有宏信息的新工作簿保存为Macro-Enabled Workbook，道理同上。

#### 宏保存在Personal Macro Workbook

 在保存当前工作簿时候，不会有错误提示，可以正常保存，但是当要退出Excel程序的时候，会收到如下错误提示：

 ![Excel Message](/images/save-personal-macro-book.png)

此时应当点击"Save"，否则我们录制的宏将不会被保存。

*注意：之所以在退出Excel程序的时候才会收到这样的提示，是因为Personal Macro Workbook是一个隐藏的Excel文件，正常情况下无法直接操作这个文件。*
               
>动手练习：

>关闭所有已打开的Excel程序，然后打开“2016 Revenues”。

>在“2016 Revenues”内录制宏，宏的名字为“Formatting”，不设置快捷键，保存位置为当前工作薄，Description留空。

>录制以下操作：

>1. 设置A1:M1为合并并居中，行高30，内容垂直居中，字号20。
>2. 设置A2:M2填充色为淡蓝色。
>3. 设置B3:M5数字格式为“Accounting”。
>4. 在A6输入“Total:”，在第六行，B到M每一列进行求和。
>5. 设置A6:M6字体加粗，上边框线为双线。
>6. 在L8输入“Grand Total:”，在M8对第六行进行求和。
>7. 设置第八行字体加粗。
>8. 设置所有列，自动适应列宽。

>结束录制。

>不要关闭“2016 Revenues”，打开其余两个工作簿，并尝试运行“Formatting”宏。
