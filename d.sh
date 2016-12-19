#!/bin/sh

#Pull the most current files from GitHub first
git pull origin master

#Gnerate and deploy to GitHub page
hexo generate
hexo deploy
