#!/bin/bash
foldername=$(date +%Y-%m-%d-%H:%M:%S)
host=$(hostname)
mkdir /home/ubuntu/$foldername
cd /home/ubuntu/
cd $foldername
free >> free.log
df >> df.log
vmstat >> vmstat.log
netstat >> netstat.log
ps >> ps.log
cd ..
zip -r --password accenturehack $foldername.zip $foldername
rm -rf $foldername
aws s3 cp $foldername.zip s3://AwSome-accenture-hackforward/$host/
