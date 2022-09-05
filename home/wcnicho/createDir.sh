#!/bin/bash

cd /scratch1/wcnicho

dir='Male_LT/0_1'
echo $dir
mkdir -p $dir


dir='Female_LT/0_1'
echo $dir
mkdir -p $dir


for name in 'Pooled' 'Male' 'Female' 'Unreported'
do
  for tension in '0_4' '0_45' '0_5' '0_55' '0_6' '0_65' '0_7'
  do
    printf -v dir "%s/%s" "$name" "$tension"
    echo $dir
    mkdir -p $dir
  done
done
