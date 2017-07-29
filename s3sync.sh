#!/bin/bash
host=$(hostname)
aws s3 sync /home/ubuntu/logs/  s3://AwSome-accenture-hackforward/$host/

