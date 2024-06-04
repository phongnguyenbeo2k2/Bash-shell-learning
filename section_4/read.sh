#!/bin/bash

#read -p "Input your name: " name
#add option -t for provide the time for user enter the argument, if it reach time out, the shell will next command
#read -t 5 -p "Input your name: " name
#add option -s for don't show whatever you type in the terminal
read -s -t 5 -p "Input your name: " name
read -N 2 -p "Input your age: " age
read -p "Input youe town: " town 
#read name age town
echo "My name is $name"
echo "I ame $age years old."
echo "My home town is $town."