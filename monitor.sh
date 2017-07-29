#!/bin/bash
foldername=$(date +%Y-%m-%d-%H:%M:%S)
mkdir /home/ubuntu/logs/$foldername
cd /home/ubuntu/logs/
cd $foldername
free >> free.log
df >> df.log
vmstat >> vmstat.log
netstat >> netstat.log
ps >> ps.log
cd ..
zip -r --password accenturehack $foldername.zip $foldername
rm -rf $foldername
