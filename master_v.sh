#!/bin/sh
search_dir=.git/refs/tags/*
B1=$(echo $search_dir | cut -d "/" -f 4)
echo $B1
