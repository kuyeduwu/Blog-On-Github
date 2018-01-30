---
title: jQuery - Paste Event for Text Box
date: 2018-01-30 13:32:16
tags: jQuery
categories: jQuery
---

Demo: [JsFiddle](https://jsfiddle.net/hkjmtg9a/)

<!--more-->

## HTML

```HTML
<div>
  <input type="text" id='txt'>
</div>
```

## JavaScript

```js
$('#txt').on('paste', function(e){
  var content = '';

  if (isIE()) {
    //IE allows to get the clipboard data of the window object.
    content = window.clipboardData.getData('text');
  } else {
    //This works for Chrome and Firefox.
    content = e.originalEvent.clipboardData.getData('text/plain');
  }

  alert(content);
});

function isIE(){
  var ua = window.navigator.userAgent;

  return ua.indexOf('MSIE ') > 0 || ua.indexOf('Trident/') > 0 || ua.indexOf('Edge/') > 0
}
```
