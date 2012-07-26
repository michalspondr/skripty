#!/bin/bash
# Shows row count for each table in database
# 
# Useful for e.g. simple database replication check

# Configure here
DBHOST="localhost"
DBUSER="root"
DB="database"

# SQL command
sql="mysql -h$DBHOST -u$DBUSER --default-character-set=utf8 -N $DB"


# Queries
tables=(`echo "show tables" |$sql`)
for table in ${tables[*]}; do
    echo -ne $table"\t"
    echo "select count(*) AS $table from $table" |$sql
done


