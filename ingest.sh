#!/bin/bash

BATCHIDS=${1:-foundBatchIDs.txt}
ARCHIVE=${2:-dtn-itc.ifa.hawaii.edu:/bigdata/ps1/s27}

cat $BATCHIDS | while read b
do
  echo Ingesting $b
  eval `echo $b | sed -e 's:/: :g' | awk '{printf("slice=%s;batch=%s\n",$5,$6)}'`
  wget http://128.171.123.254:22280/ds/${slice}/${batch}/${batch}.tar.gz
  fits=`tar -xzvf ${batch}.tar.gz | grep FITS`
  echo Found $fits ...
  python3 ipp-psps.py $fits
  bash ipp-psps-pack.sh $batch
  gzip ${batch}_Detection.csv
  echo scp ${batch}_Detection.csv.gz $ARCHIVE
  rm -rf *.csv B* *.gz
done
