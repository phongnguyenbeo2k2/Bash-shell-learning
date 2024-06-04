#!/bin/bash

read -p "What is your first name?: " fistname
read -p "What is your last name?: " lastname
read -N 10 -s -p "What is your phone number? (Must be begined with 0 and have 10 digits): " phonenumber
echo "$fistname,$lastname,$phonenumber" >> extension.csv
#echo "\n"
#print the newline don't have anything
echo 