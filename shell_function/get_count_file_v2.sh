#!/bin/bash

path=$1
function get_count()
{
local count_file=$(ls $path | wc -l)
echo "The now working direcoty is $path"
echo "The no of file in working directory is $count_file"
}

get_count 