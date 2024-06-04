#!/bin/bash

#!/bin/bash


# Author: Phong
# Date created: 4/6/2024
# Last modified: 4/6/2024


#Description
#Create a function to print progress bar to monitor console and using this function in script to get progress for user while writting a large file.


file_test=test_large_file.txt

function process_progress_bar() {
   local percent=$1
   local length=${2:-100}
   local fill=${3:-█}
   local completed=""
   local remaining=""
   local i
   local completed_length=$((length * percent / 100))
   local remaining_length=$((length - completed_length))
   for ((i=0; i<$completed_length; i++)); do
       completed="${completed}${fill}"
   done

   for ((i=0; i<$remaining_length; i++)); do
       remaining="${remaining}-"
   done
   printf "\r|%s%s| %.${decimals}f%%" "$completed" "$remaining" "$percent"
}
function print_progress_bar()
{
   local iteration=$1
   local total=$2
   local decimals=${3:-1}
   local length=${4:-100}
   local fill=${5:-█}
   local size=${6:-30}
   local percent=$((iteration * 100 / total))
   local total_size=$((size * percent / 100))
   process_progress_bar "$percent" "$length" "$fill"
   printf "  ---> %d MB" "$total_size"
}
function execute_progress_bar()
{
   local total_iterations=100
   local iteration
   local decimals
   local length=100
   local fill
   local size
   if [ "$#" -eq 0 ]; then
   for ((i=1; i<=total_iterations; i++)); do
      sleep 0.1
      print_progress_bar "$i" "$total_iterations"
      if [ "$i" -eq 100 ]; then
         printf "\n"
         dd if=/dev/urandom of=test_large_file.txt bs=1M count=30
      else
         dd if=/dev/urandom of=test_large_file.txt bs=1M count=$((i*30/100)) seek=$((i*30/100)) &> /dev/null
      fi
   done
   else
      while getopts ":i:t:d:l:f:" opt; do
         case $opt in
            i)
               iteration=$OPTARG
               echo "iteration: $iteration"
               ;;
            t)
               total_iterations=$OPTARG
               echo "total_iterations: $total_iterations"
               ;;
            d)
               decimals=$OPTARG
               echo "decimal: $decimals"
               ;;
            l)
               length=$OPTARG
               echo "length: $length"
               ;;
            f)
               fill=$OPTARG
               echo "fill: $fill"
               ;;
            \?)
               echo "Invalid option: -$OPTARG" >&2;;
            :)
               echo "Option -$OPTARG requires an argument, but you don't enter argument." >&2;;
         esac
      done


      # Check if iteration arguments are provided
      if [ -n "$iteration" ]; then
         echo "-i (iteration) arguments are required by user."
         print_progress_bar "$iteration" "$total_iterations" "$decimals" "$length" "$fill" "$size"
         printf "\n"
         exit 0
      fi

      for ((i=0; i<=total_iterations; i++)); do
         echo "Test"
         sleep 0.1
         print_progress_bar "$i" "$total_iterations" "$decimals" "$length" "$fill" "$size"
         if [ "$i" -eq 100 ]; then
            printf "\n"
            dd if=/dev/urandom of=test_large_file.txt bs=1M count=30
         else
            dd if=/dev/urandom of=test_large_file.txt bs=1M count=$((i*30/100)) seek=$((i*30/100)) &> /dev/null
         fi
      done
   fi
}
#check this bash sript is called by other script or is called directly, if it is called directly value of BASH_SOURCE[0] is equal = 0
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
   execute_progress_bar "$@"
fi
#process_progress_bar $@
#check the exists of the file
if [ -f "$file_test" ]; then
    echo "File exists."
else
    echo "File does not exist."
fi


