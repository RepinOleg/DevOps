#!bin/bash

SUCCESS=0
FAIL=0
FILE_NAME="test.txt"
DIFF_RES=""
declare -a extra=(
    "hello"
    "onE"
    "TEST"
    "World"
    "Hello"
    "h[az]"
    "f[ao]" 
    "\dschool"
)

for var in -e -i -v -c -n
do
    TEST="$var for $FILE_NAME"
    ./s21_grep $TEST > s21_grep.txt
    grep $TEST > grep.txt
    DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
    if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
        then
            echo $TEST >> success.log
            (( SUCCESS++ ))
        else
            echo $TEST >> fail.log
            (( FAIL++ ))
    fi
    rm s21_grep.txt grep.txt
done


for var in -h -s
do
    TEST2="$var for $FILE_NAME"
    ./s21_grep $TEST2 > s21_grep.txt
    grep $TEST2 > grep.txt
    DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
    if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
        then
            echo $TEST2 >> success.log
            (( SUCCESS++ ))
        else
            echo $TEST2 >> fail.log
            (( FAIL++ ))
    fi
    rm s21_grep.txt grep.txt
done

TEST3="-f pattern.txt $FILE_NAME"
./s21_grep $TEST3 > s21_grep.txt
grep $TEST3 > grep.txt
DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
    then
        echo $TEST3 >> success.log
            (( SUCCESS++ ))
        else
            echo $TEST3 >> fail.log
            (( FAIL++ ))
    fi
    rm s21_grep.txt grep.txt


echo "SUCCESS $SUCCESS" >> success.log
echo "FAIL $FAIL" >> success.log

