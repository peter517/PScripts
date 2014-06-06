#!/bin/sh 

[ -z $1 ] && echo "no param" && return

data_file=$1
yfield="KB"
xfield="Time"
title="videochat memory tendency"
create_date=`date +%Y-%m-%d-%H-%M-%S`
output_chart_file="vc-$create_date.png"

echo "
set terminal pngcairo lw 2
set terminal png size 1280, 720
set title \"$title\"
set ylabel \"$yfield\"
set xlabel \"$xfield\"
set xdata time
set timefmt \"%Y%m%d%H%M%S\"
set output './$output_chart_file'
plot \"$data_file\" using 1:2 with lines 
" | gnuplot
