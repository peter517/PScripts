#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-06-08_21:26:50
#Comments:
#	create chart base on the time using gnuplot, time format is matched whith the data_file

[ -z $1 ] && echo "no param" && return

data_file=$1
yfield="MS"
y2field="Temp"
title="Play Cost Time"
create_date=`date +%Y%m%d-%H%M%S`
output_chart_file="vc-$create_date.png"
time_format="%Y%m%d%H%M%S"

echo "
set terminal pngcairo lw 2
set terminal png size 1280, 720
set title \"$title\"
set ylabel \"$yfield\"
set y2label \"$y2field\"
set grid
set output './$output_chart_file'
plot \"$data_file\" using 1:1 with linespoints linecolor 3 linewidth 2 pointtype 7 pointsize 1, \"$data_file\" using 1:2 with linespoints linecolor 6 linewidth 2 pointtype 4 pointsize 1
" | gnuplot
