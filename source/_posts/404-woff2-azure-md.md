---
title: 404 Error When Loading WOFF2 Fonts from Azure Websites
date: 2018-03-27 13:25:17
tags: azure, font, woff2
categories: Azure
---

When publishing a new website in Azure, using Azure App Service, the woff2 fonts couldn't be loaded with an 404 not found error.

<!--more-->

To fix this issue, you need to add the following content to your `web.config` file:

```xml
<configuration>
  <system.WebServer>
    <staticContent>
      <remove fileExtension=".woff" />
      <remove fileExtension=".woff2" />
      <mimeMap fileExtension=".woff" mimeType="application/font-woff" />
      <mimeMap fileExtension=".woff2" mimeType="application/font-woff2" />
    </staticContent>
  </system.WebServer>
</configuration>
```

Thanks to [ppolyzos's](https://ppolyzos.com/2016/03/16/mime-types-missing-in-azure-websites/) blog.
