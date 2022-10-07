#!/bin/bash

batch=$1
fitsid=`ls $batch/*.FITS`
fitsid=`expr ${fitsid} : "${batch}/\(.*\).FITS"`
echo $fitsid
outfile="${batch}_Detection.csv"
n=1
while test $n -le 60
do
  id=$((n * 3 + 1))
  test -f ${fitsid}-$id.csv || break
  case $n in
  1) cat ${fitsid}-$id.csv >$outfile ;;
  *) tail -n +2 ${fitsid}-$id.csv >>$outfile ;;
  esac
  n=$((n+1))
done
