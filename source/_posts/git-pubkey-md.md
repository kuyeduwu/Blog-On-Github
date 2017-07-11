---
title: SSH连接提示 Permission denied (publickey)的解决方法
date: 2017-07-11 22:07:16
tags: Git,SSH
categories: Accessories
---

## 前提

SSH Key已经正常生成，并已经成功配置到GitHub上。

## 问题

通过SSH连接GitHub时出现错误提示：
```bash
Permission denied (publickey).
```

## 原因

可能是因为在生成Key的时候，采用了自定义文件名，没有采用默认的`id_rsa`文件名，导致系统在本地找不到与`publickey`相对应的`privatekey`。

未做进一步测试，所以这个原因只是猜测。

## 解决

执行`ssh-add`命令，添加自定义文件名的`privatekey`：
```bash
ssh-add ~/.ssh/FileNameofYourPrivateKey
```
