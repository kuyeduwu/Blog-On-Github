#!/bin/sh

#Push the new posts to GitHub
git push -u origin master

#Gnerate and deploy to GitHub page
hexo generate
hexo deploy
