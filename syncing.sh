#!/bin/bash
cd /home/ubuntu/
git clone https://github.com/mayurah/aws-sync
rsync -a aws-sync/ /var/www/html
