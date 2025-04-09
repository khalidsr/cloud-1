#!/bin/bash

DB=/home/said/Desktop/cloud_1/inception/data/DB/
WP=/home/said/Desktop/cloud_1/data/inception/WordPress/
cd $DB
sudo rm -rf *
cd $WP
sudo rm -rf *
exec $@