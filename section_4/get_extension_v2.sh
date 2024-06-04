#!/bin/bash

read -p "What is your first name?: " fistname
read -p "What is your last name?: " lastname
read -N 10 -s -p "What is your phone number? (Must be begined with 0 and have 10 digits): " phonenumber
echo 
PS3="What is your department?: "
select depart in "finance" "sales" "customer service" "engineering"
do
echo "Your department is $depart"
break
done
echo "$fistname,$lastname,$phonenumber,$depart" >> extension_v2.csv
#echo "\n"
#print the newline don't have anything
echo 