---
title: Windows下多个SSH Key管理
date: 2017-12-10 14:28:25
tags: SSH
categories: Accessories
---

## SSH Key生成

在通过`ssh-keygen`命令生成Key的时候，当提示`Enter file in which to save the key`时，为不同的Key添加不同的后缀名，例如：
 - 用于GitHub的Key`id_rsa_github`。
 - 用于Bitbucket的Key`id_rsa_bitbucket`。

<!--more-->

## 使用密钥管理器

执行`ssh-add`命令将私钥添加至`ssh-agent`:

```
ssh-add ~/.ssh/id_rsa_github
ssh-add ~/.ssh/id_rsa_bitbucket
```

这一步有可能出现`Could not open a connection to your authentication agent.`错误，解决方法如下：
1. 执行`ps aux | grep ssh`命令，查看`ssh-agent`的线程PID。
2. 执行`kill -9 PID`杀死线程。
3. 进入`.ssh`目录，执行以下命令：
```
exec ssh-agent bash
eval ssh-agent -s
```
4. 重新执行`ssh-add`命令，将私钥添加至`ssh-agent`。

## 创建`config`文件

在`.ssh`目录下新建一个`config`文件，编辑文件内容：
```
# github
Host github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_github
User Yourname

# bitbucket
Host bitbucket.com
HostName bitbucket.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_bitbucket
User Yourname
```
