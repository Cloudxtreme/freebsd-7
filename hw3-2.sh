#!/usr/bin/env sh
IFS=","
export IFS;
outfile="sa.out"
defaultgcc="gcc"
defaultgpp="g++"
ifsrc=0
ifLang=0
ifcommand=0
checkfile()
{
	if [ -e $source ];then
		echo 1
	else 
		echo 0
	fi
		
}
while getopts hs:o:l:c:  opt 
do      case "$opt" in 
	h) 	
		ifsrc=1
		ifLang=1
		ifcommand=1
		echo "Usage: ./hw3-2.sh [-h] [-s src] [-o output_file] [-l lang] [-c complier]"
		exit
		;;
	s) 
		ifsrc=1
		ifcommand=1	
		source=$OPTARG ;
		check=`checkfile`;
		if [ $check -eq 0 ];then
			echo "NO SRC!!"
			exit
		fi
		;;
	o) 
		ifcommand=1
		outfile=$OPTARG ;
		;;
	l) 
		ifLang=1
		language=$OPTARG	
		;;
	c)
		comp=$OPTARG
		if [ $comp = "gcc" -o $comp = "clang" ];then 
			defaultgcc=$comp 
		elif [ $comp = "g++" -o $comp = "clang++" ];then
			defaultg++=$comp
		else 
			echo "Wrong Only C(gcc,clang) and C++(g++,clang++)"
			exit
		fi
		shift
		;;
	
	esac
done
if [ $ifsrc -eq 0 ];then
	echo "No source"
fi 
if [ $ifcommand -eq 0 ];then
	echo "No command"
fi
if [ $ifLang -eq 0 ];then
	echo "Unknow target"
	exit
fi
for word in $language;do
		lang=$word
		if [ $lang = "c" -o $lang = "C" ];then
			`$defaultgcc -o $outfile $source`
			do=`./$outfile`
			echo $do
		elif [ $lang = "cc" -o $lang = "cpp" -o $lang = "Cpp" -o $lang = "c++" -o $lang = "C++" ];then
			`$defaultgpp -o $outfile $source`
			do=`./$outfile`
			echo $do
		elif [ $lang = "awk" -o $lang = "AWK" ];then
			do=`./$source`
			echo $do
		elif [ $lang = "perl" -o $lang = "Perl" ];then
			do=`perl ./$source`
			echo $do
		elif [ $lang = "python" -o $lang = "Python" -o $lang = "py" -o $lang = "python2" -o $lang = "Python2" -o $lang = "py2" ];then
			do=`python ./$source`
			echo $do
		elif [ $lang = "python3" -o $lang = "Python3" -o $lang = "py3" ];then
			do=`python3 ./$source`
			echo $do
		elif [ $lang = "ruby" -o $lang = "Ruby" -o $lang = "rb" ];then
			do=`ruby ./$source`
			echo $do
		elif [ $lang = "Haskell" -o $lang = "haskell" -o $lang = "hs" ];then
			do=`runhaskell ./source`
			echo $do
			
		elif [ $lang = "lua" -o $lang = "Lua" ];then
			do=`lua $source`
		elif [ $lang = "bash" -o $lang = "Bash" ];then
			do=`/usr/local/bin/bash ./$source`
			echo $do
		else
			echo "The wrong language"
			exit	
		fi
		done
