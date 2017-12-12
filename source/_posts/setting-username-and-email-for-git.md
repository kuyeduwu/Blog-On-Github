---
title: 设置Git用户名和邮箱
date: 2017-12-12 15:11:54
tags: Git
categories: Accessories
---

## 为所有Repository设置统一的用户名和邮箱

```
$ git config --global user.name "Rick"
$ git config --global user.email "myslsh_2015@163.com"
```
<!--more-->

## 为当前Repository单独设置用户名和邮箱

```
$ git config user.name "User"
$ git config user.email "user@example.com"
```

## 查看全局设置

```
$ git config --global user.name
$ git config --global user.email
```

## 查看当前设置

```
$ git config user.name
$ git config user.email
```
