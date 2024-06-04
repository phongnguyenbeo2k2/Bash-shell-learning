#!/bin/bash

function get_count()
{
local count_file=$(ls $PWD | wc -l)
echo "The now working direcoty is $PWD"
echo "The no of file in working directory is $count_file"
}

get_count