---
title: Cannot Debug Python in VS Code
date: 2018-11-12 16:25:58
tags: vscode;Python
categories: Accessories
---

When trying to debug python files from vscode, you might run into this error:

![Timeout Error](/images/vscode1.png)

<!--more-->

## Reason & Solutions

One of the possible reason is that you are using PowerShell as the default terminal for the debugging.

If you have the Python extension installed, you should have got a notice about this:

![Python Extension Notice](/images/J142kj9lqg.png)

You can just click the `Use Command Prompt` button, then kill the current terminal and reopen it.

If you missed the notification, you could follow the steps below to change the default terminal from PowerShell to Command Prompt:

1. `Ctrl + Shift + P` to open the command palette.
2. Type **select default shell** and hit **Enter**.
3. Select **Command Prompt**.
4. Kill all current terminals.
5. `Ctrl + ~` to open the terminal.

Now the terminal should be command prompt and you could debug your python files.

## Details

As of 11/12/2018, it had been confirmed by Brett Cannon 28 days ago that this is because there are some capability issues between conda and PowerShell, and this should be fixed in conda 4.6, before that, you could either change the terminal to command prompt or disable the environment activation.

## Reference

https://github.com/Microsoft/vscode-python/issues/2732#issuecomment-429994915
