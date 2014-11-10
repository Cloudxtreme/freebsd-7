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
	#	echo "Usage: ./hw3-2.sh [-h] [-s src] [-o output_file] [-l lang] [-c complier]"
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
			`cp $source doit.c`
			`$defaultgcc -o $outfile doit.c`
			do=`./$outfile`
			echo $do
			`rm doit.c`
		elif [ $lang = "cc" -o $lang = "cpp" -o $lang = "Cpp" -o $lang = "c++" -o $lang = "C++" ];then
			`cp $source doit.c`
			`$defaultgpp -o $outfile $source`
			do=`./$outfile`
			echo $do
			`rm doit.c`
		elif [ $lang = "awk" -o $lang = "AWK" ];then
			`cp $source ./doit.awk`
			`chmod u+x ./doit.awk`
			do=`./doit.awk`
			echo $do
			`rm ./doit.awk`
		elif [ $lang = "perl" -o $lang = "Perl" ];then
			`cp $source ./doit.pl`
			`chmod u+x ./doit.pl`
			do=`perl ./doit.pl`
			echo $do
			`rm ./doit.pl`
		elif [ $lang = "python" -o $lang = "Python" -o $lang = "py" -o $lang = "python2" -o $lang = "Python2" -o $lang = "py2" ];then
			`cp $source ./doit.pl`
			`chmod u+x ./doit.pl`
			do=`python ./doit.pl`
			echo $do
			`rm ./doit.pl`
		elif [ $lang = "python3" -o $lang = "Python3" -o $lang = "py3" ];then
			`cp $source ./doit.pl`
			`chmod u+x ./doit.pl`
			do=`python3 ./doit.pl`
			echo $do
			`rm ./doit.pl`
		elif [ $lang = "ruby" -o $lang = "Ruby" -o $lang = "rb" ];then
			`cp $source ./doit.pl`
			`chmod u+x ./doit.pl`
			do=`ruby ./doit.pl`
			echo $do
			`rm ./doit.pl`
		elif [ $lang = "Haskell" -o $lang = "haskell" -o $lang = "hs" ];then
			`cp $source ./doit.hs`
			do=`runhaskell ./doit.hs`
			echo $do
			`rm ./doit.hs`
			
		elif [ $lang = "lua" -o $lang = "Lua" ];then
		`cp $source ./doit.sh`
			`chmod u+x ./doit.sh`
			do=`gcc $source --llua -llualib -o $outfile`
		`rm ./doit.sh`
		elif [ $lang = "bash" -o $lang = "Bash" ];then
			`cp $source ./doit.sh`
			`chmod u+x ./doit.sh`
			do=`/usr/local/bin/bash ./doit.sh`
			echo $do
			`rm ./doit.sh`
		else
			echo "The wrong language"
			exit	
		fi
		done
