#!/bin/bash


cd cat/
bash tests_for_s21_cat.sh

if [ -s fail.log ]; then
	cat fail.log
	exit 1;
else
	echo "Tests for cat passed"
fi

cd ../grep/
bash tests_for_grep.sh
if [ -s fail.log ]; then
	cat fail.log
	exit 1;
else
	echo "Tests for grep passed"
fi
