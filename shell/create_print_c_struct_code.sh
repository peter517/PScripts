#!bin/sh

[ $# -le 1 ] && echo "no param" && return

fields=`cat $1 | awk '{ gsub(/^[ \t]+/, "", $0); if ($0 != "" && match($0, /^\*|^\//) == false ) print $2}' | xargs `
echo fields=$fields

for field in $fields
do
	field=${field%%;}
	field_struct=$3
	if [ -z $field_struct ]; then
		echo "x264_log( h , X264_LOG_INFO, \"$field=%$2\n\" ,h->param.$field);" 
	else
		echo "x264_log( h , X264_LOG_INFO, \"${field_struct}.$field=%$2\n\" ,h->param.${field_struct}.$field);" 
	fi
done
