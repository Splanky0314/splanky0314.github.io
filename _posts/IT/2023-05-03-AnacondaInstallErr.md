---
layout: post
title: How to solve "Unable to create process using'C:\Users\Username\Anaconda3"
subheading:
author: Daeun
categories: IT
banner:
tags: Anaconda Anaconda_Install_Error Path_space
---

## Error Situation
I installed Anaconda3. When I activate anaconda prompt, it shows ERR
```
Unable to create process using'C:\Users\Username\Anaconda3 ~~
```

## How to Solve?
If your username has whitespace, you should change installation path.

I changed installation path
```
C:\Users\Daeun Kim\Anaconda3
```
to
```
C:\Users\Public\Anaconda3
```

[More Information](https://github.com/jupyter/notebook/issues/4656)