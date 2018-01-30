---
title: FontAwesome Hover Effect without JS
date: 2018-01-30 14:29:48
tags: FontAwesome,CSS
categories: CSS
---

Demo: [JsFiddle](https://jsfiddle.net/z479yomw/)
Thanks to: [Hans](http://makemysoft.com/)

<!--more-->

## HTML

```HTML
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<i id='hover-effect' class="fa" style="font-size:24px"></i>

</body>
</html>
```

## CSS

```CSS
#hover-effect:before{
	content:"\f204";
}

#hover-effect:hover:before{
	content:"\f205";
}
```

## Instruction

 - `\f204` is the css content for the Font Awesome icon: fa-toggle-off, and `\f205` is the css content for icon: fa-toggle-on.
 - The `:before` keyword is necessary.
 - The container element (`#hover-effect`) should have the class `fa`.
