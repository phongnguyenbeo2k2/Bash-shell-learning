#!/bin/bash

function hello()
{
    echo "Hello $1"
}

read -p "Enter your name: " name
hello $name