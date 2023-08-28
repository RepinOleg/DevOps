#!/bin/bash

clang-format --style=Google -n cat/*.c grep/*.c &> style_result
if [ -s style_result ]; then
	cat style_result
	exit 1;
else
	echo "Style ok"
	exit 0;
fi
