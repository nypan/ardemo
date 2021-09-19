#!/bin/bash

export PATH=/database/config/db2inst1/sqllib/bin/:$PATH

db2 connect to USERDB user db2inst1 using hemligt

# db model
db2 -tvf /var/custom/sql/users_table.sql

# data 
db2 import from /var/custom/data/users_insert.csv of del insert into users

# Terminate
db2 terminate
touch /tmp/end.txt