#!/bin/sh
search_dir=.git/refs/tags/*
echo $search_dir
echo $search_dir | cut -d "/" -f 4
B1=$(echo $search_dir | cut -d "/" -f 4)
echo $B1
