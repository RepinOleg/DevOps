#!/bin/bash
. ./check_input.sh
. ./rm_dir.sh
export parametr=$1
validation
remove_folders "$parametr"