layout: posts
title: Python Note - Day 2
date: 2017-01-05 10:18:21
tags: Python
categories: Python
---

## dict

Python uses `{}` to represent dictionary:
```bash
>>> scores = {'Rick':98,'Bob':78,'Tom':92}
>>> scores['Rick']
98
>>> source.get('Rick')
98
```

Use `in` to check if the key is included in the dictionary:
```bash
>>> 'Angel' in scores
False
```

Use `pop()` to remove items from dictionary:
```bash
>>> scores.pop('Rick')
98
>>> scores
{'Bob':78,'Tom':92}
```

## set

A dictionary contains both keys and values, but a set contains keys only, no values, also, you need to provide a list to get a set:
```bash
>>> s = set([1,2,3])
>>> s
{1,2,3}
```

Duplicate values in a list will be removed automatically:
```bash
>>> s = set([1,2,2,3,3,4])
>>> s
{1,2,3,4}
```

Add / Remove keys:
```bash
>>> s.add(5)
>>> s
{1,2,3,4,5}
>>> s.remove(2)
>>> s
{1,3,4,5}
```

Union or intersection:
```bash
>>> s1 = set([1,2,3,4])
>>> s2 = set([2,3,4,5])
>>> s1 & s2
{2,3,4}
>>> s1 | s2
{1,2,3,4,5}
```

## Functions

In Python, a function name can be assigned to a variable:
```bash
>>> a = abs
>>> a(-1)
1
```

Declare a function
```bash
def myFunc(x): # myFunc is the function name, x is the parameter for the function.
    if x >= 0:
        return x
    else:
        return -x

print(myFunc(-1))
```




### Arguments
#### Position Arguments
```bash
def power(a):
    return a * a

def powern(a,n):
    s = 1
    while n > 0:
        n = n -1
        s = s * a
    return s
```

All basic arguments are required when the function is invoked.

#### Default Arguments
```bash
def powern(a,n=2): # n is a default argument and the default value is 2.
    s = 1
    while n > 0:
        n = n -1
        s = s * a
    return s
```

When calling the function, the default argument can be ignored, if so, the default value will be used.

If a function has more than 1 default arguments, we might need to specify the argument name when providing values:
```bash
def newHires(name, age, gender='F', hometown='China')
    print('New Hire:', name, gender, age, 'Years old.', 'From', hometown)
```

If the **gender** is different, but **hometown** is same to the default value, we may invoke this function like:
```bash
newHires('Rick', 20, 'M')
```

If the **hometown** is different, but **gender** is same to the default value, we may invoke this function like:
```bash
newHires('Rick', 20, hometown='U.K.')
```

#### Multi Value Arguments
```
def calc(*numbers): # The * character indicates that the number of value in the argument is non-staionary.
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum
```

For the above function, we can call it like:
```bash
>>> calc(1,2,3)
14
>>> calc(1,2,3,4,5)
55
```

Pass a list into the function:
```bash
>>> nums = [1,2,3]
>>> calc(nums[0],nums[1],nums[2])
14
```

Or:
```bash
>>> nums = [1,2,3]
>>> calc(*nums)
14
```
