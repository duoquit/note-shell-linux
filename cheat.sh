#!/bin/sh
#Hello world
echo "Hello World" #-> Hello World

#Variable
MESS="Duong dep trai"
echo $MESS #-> Duong dep trai

# read variable from key board
echo What is your name?
read MY_NAME # <- Duong
echo "Hello $MY_NAME - hope you're well." # -> Hello Duong - hope you're well.

# Wildcards
echo * #-> print all file, sub folder in folder-pwd

# Escape Characters
echo Hello       World          #-> Hello World
echo "Hello       World"        #-> Hello       World
echo "Hello   \"World\""        #-> Hello   "World"
echo "Hello   " World ""        #-> Hello    World 

# conditions
# bash | operator
# -eq <=> ==
# -ne <=> !=
# -gt <=> >
# -ge <=> >=
# -lt <=> <=
# -le <=> <=
# -z  <=> == null

echo How old are you?
read age 
if [ "$age" -gt 20 ] then
    echo "${age}  > 20"
    elif [ "$age" -eq 20 ]; then
    echo "${age}  == 20"
else
    echo "${age}  < 20"
fi

# Loops
# For
for i in hello 1 * 2 goodbye 
do
  echo "Looping ... i is set to $i"
done
# Looping ... i is set to hello
# Looping ... i is set to 1
# ... (loop in *)
# Looping ... i is set to 2
# Looping ... i is set to goodbye

# While
INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
  echo "Please type something in (bye to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
done
# Please type something in (bye to quit)
# <- Duong
# You typed: Duong
# Please type something in (bye to quit)
# <- bye
# You typed: bye

# trick
while read f
do
  case $f in
	hello)		echo English	;;
	howdy)		echo American	;;
	gday)		echo Australian	;;
	bonjour)	echo French	;;
	"guten tag")	echo German	;;
	*)		echo Unknown Language: $f
		;;
   esac
done < logs.txt #-> write to file

#example 
for runlevel in 0 1 2 3 4 5 6 S
do
  mkdir rc${runlevel}.d # auto create folder
done

# avanded variable
# Tập hợp các biến bao gồm từ $0 -> $9 và $#
# $# là tổng số biến được đưa vào chương trình
# $0->$9 được set tự động bởi shell 
# $$ là PID (Process IDentifier) của chương trình shell vừa mới chạy 
# $! là PID (Process IDentifier) của chương trình chạy nền cuối cùng.

# $ ./test.sh hello world earth
echo "I was called with $# parameters" #-> I was called with 3 parameters
echo "My name is $0"                   #-> My name is ./test.sh
echo "My first parameter is $1"        #-> My first parameter is hello
echo "My second parameter is $2"       #-> My first parameter is world
echo "All parameters are $@"           #-> My first parameter is earth

# External Programs
MYNAME=`grep "^${USER}:" /etc/passwd | cut -d: -f5`
echo $MYNAME #-> username

# Function

# ./test.sh a b c
myfunc()
{
  echo "I was called as : $@"
  x=2
}
# main()
echo "Script was called with $@" #-> Script was called with a b c
x=1
echo "x is $x"                   #-> x is 1
myfunc 1 2 3                     #-> I was called as : 1 2 3
echo "x is $x"                   #-> x is 2

# Recursion (Đệ quy)
rename()
{
  # expects to be called as: rename .txt .bak 
  FROM=$1
  TO=$2

  for i in *$FROM
  do
    j=`basename $i $FROM`
    mv $i ${j}$TO
  done
}
