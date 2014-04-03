#!/bin/sh


#[ -z "$1" ] && echo "no svn commit, exit" && return

IFS=" "

INGORE_FILES="src/mmpc/android/jnilib/jni/jni_entry.cc test/android/chatdemo/src/main/java/ali/mmp/chatdemo/ChatDemo.java src/mmpc/android/jnilib/jni/Application.mk src/mmpc/android/mmpc/src/main/java/ali/mmpc/util/MmpcGlobal.java src/mmpc/android/mmpc/src/main/java/ali/mmpc/util/LoadLibraryUtil.java"
VAILD_POSTFIX="c java cc h mk sh cpp"

SVN_CHANGE_FILES=`svn status | egrep [MA] | awk '{ if ($1 == "M" || $1 == "A") {print $2} }' | xargs `

files_to_submit=""
is_file_to_submit=true
is_file_vaild=false

echo && echo "change files:"

for change_file in $SVN_CHANGE_FILES
do
	echo $change_file
	change_file_postfix=${change_file##*.}
	for postfix in $VAILD_POSTFIX
        do
        	[ "$change_file_postfix" == $postfix ] && is_file_vaild=true && break
        done
  
	[ "$is_file_vaild" != true ] && continue
	is_file_vaild=false

	for ingore_file in $INGORE_FILES
	do	
		[ "$ingore_file" == $change_file ] && is_file_to_submit=false && break
	done
	
	[ "$is_file_to_submit" == true ] && files_to_submit=$files_to_submit" "$change_file
	is_file_to_submit=true
done 

echo ""
[ "$files_to_submit" == "" ] && echo "no files to summit!" && return 


echo "file_to_submit:"
for file_to_submit in $files_to_submit
do
	echo $file_to_submit
done

#echo && echo "ready to submit? y/n" && read read_to_summit
#[ $read_to_summit != y ] && echo "stop svn commit" && return

param_comment=$1
[ -z $param_comment ] && echo && echo "enter commit comment:" && read input_comment
comment=${param_comment:-$input_comment} 

echo comment=$comment

svn ci -m "$comment" $files_to_submit

