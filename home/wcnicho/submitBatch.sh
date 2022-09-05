#!/bin/bash
cd /scratch1/wcnicho

file=0
idx=0
start_idx=$1

while [ $((idx++)) -lt 150 ]
do
  printf -v file 'ValSim-%03d.sh' $((start_idx++))
  echo $file
  qsub $file
  rm $file
 
done
qstat -u wcnicho
