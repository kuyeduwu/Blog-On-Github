layout: posts
title: Python Note - Day 1
date: 2017-01-03 14:21:15
tags: Python
categories: Python
---

## Version

There are 2 existing versions of Python: Python 2.7.x and Python 3.5.x, I don't know the detailed discrepancies between the two versions but I think the newer is the future, so this note is all about Python 3.5.x and above.

<!--more-->

## Python on Linux

Many Linux distributions use Python 2.7.x by default, since the core of many popular workspaces on Linux like Unity, Gnome and KDE are based on Python 2.7.x.

But it is ok to run both versions of Python on one Linux machine. The only problem maybe you need to type `python3` instead of `python` to test Python 3.5.x scripts in Terminal, it is because the default Python program in Linux is Python 2.7.x.

## Overview

- Python language is case sensitive.
- Either `'` or `"` can be used to indicate a string.
- The escape character in Python is `\`.
```bash
>>> print('I\'m Rick.')
I'm Rick.
```
- An `r` before any string will cancel the escape function.
```bash
>>> print(r'I\'m Rick.')
I\'m Rick.
```
- The data type of the result of `input()` is string, if a number is required, you should use `int()` to convert the string to number.
```bash
>>> age = input('How old are you:')
>>> age = int(age)
>>> print('You will be %d years old after 5 years.' % (age + 5))
You will be XX years old after 5 years.
```

## Functions and Methods about string

By default, Python3 uses Unicode to encode strings.

A prefix `b` in a string indicates that the data type is `bytes`.
```bash
>>> a = b'ABC'
>>> print(a)
b'ABC'
```

- `ord()`: Return the Unicode of the character.
- `chr()`: Return the character represents by the Unicode provided.
- `str.encode('ascii')`: Encode the string by using ASCII, the data type of the result will be `bytes`.
- `str.encode('utf-8')`: Encode the string by using UTF-8, the data type of the result will be `bytes`.
- `byte.decode('utf-8')`: Convert the byte stream to string, encoded by UTF-8, the data type of the result will be `bytes`.
- `len()`: Return the length of the string.
```bash
>>> len("abc")
3
>>> len("你好")
2
>>> len(b"abc")
3
>>> len("你好".encode('utf-8')) # utf-8 uses 3 bytes to represent a character in chinese.
6
```

In order to make sure the Python script runs properly under a multi-language environment, we usually add the following line at the beginning of the script:
```bash
# -*- coding: utf-8 -*-
```

## Placeholders

- `%d`: Integer
- `%f`: Floating point number
- `%s`: String
- `%x`: Hexadecimal

For example:
```bash
>>> 'Hi %s, you have earned $%d this month.' % ('Rick', 1000)
Hi Rick, you have earned $1000 this month.
```

If you are not sure which placeholder to use, `%s` always works, it could convert any type to string.

## List

Python uses `[]` to represent list:
```bash
>>> teammembers = ['Rick','Bob','Tom']
>>> teammembers
['Rick', 'Bob', 'Tom']
```

- Use `len()` to get the **count** of a list.
- Use the index number to access the items in a list, index number start from **0**.
```bash
>>> teammembers[0]
'Rick'
```
- Use the index `-1` to get the last item in a list.

### Add item to list

```bash
>>> teammembers.append('Lisa') # Append a new item to the end of the list.
>>> teammembers
['Rick', 'Bob', 'Tom', 'Lisa']
>>> teammembers.insert(1,'Lily') # Insert a new item to the position of index number 1.
>>> teammembers
['Rick', 'Lily', 'Bob', 'Tom', 'Lisa']
```

### Remove from list
```bash
>>> teammembers.pop() # Remove the last item from the list.
>>> teammembers
['Rick', 'Lily', 'Bob', 'Tom']
>>> teammembers.pop(1) # Remove the 2nd(index number 1) item from the list.
>>> teammembers
['Rick', 'Bob', 'Tom']
```

### Change the value
```bash
>>> teammembers(1)='Lily'
>>> teammembers
['Rick', 'Lily', 'Tom']
```

## tuple

Python uses `()` to represent tuple, a tuple is a data type which is very similar to list, but you cannot edit the tuple once it is created.
```bash
>>> teammembers('Rick','Bob','Tom')
>>> teammembers
('Rick', 'Bob', 'Tom')
>>> teammembers[1] # Like list, we use `[]` and the index number to access items in tumple, you cannot use `()`.
'Bob'
```

## Why use tuple

The restriction on tuple protects your data from unintentional editing.

## If
```bash
age = 20
if age >= 18:
    print('adult')
elif age >=10:        # elif is the short form of else if
    print('teenager')
else:
    print('kid')
```
