#!/bin/bash

x=2.5
y=2
#echo $((x + y))
#echo $((x - y))
#echo $((x / y))
#echo $((x * y))
echo "scale=2;$x * $y" | bc