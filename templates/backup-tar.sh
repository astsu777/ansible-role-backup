#!/bin/bash
#Version 2.0

#START
# Tar variables
DATE=`date +%d-%b-%Y`                   # This Command will add date in Backup File Name
FILENAME=fullbackup-$DATE.tar.gz        # Here I define Backup file name format
SRCDIR=/                                # Location of Important Data Directory (Source of backup)
DESDIR=/backups/archives		# Destination of backup file

# Database variable
user="{{ mysql_user}}"                        		# username for database eg. root
password="{{ mysql_root_password }}"  		        # password for database
backup_path="/backups/databases"      		  	# path where backup is stored
databases=`mysql --user=$user --password=$password -e "SHOW DATABASES;" | tr -d "| " | grep -Ev "(Database|information_schema|performance_schema)"`


# Backup all databases in single file
mysqldump --user=$user --events --ignore-table=mysql.event --password=$password --all-databases > $backup_path/alldbbackup-$DATE.sql


# Backup databases
for db in $databases; do
mysqldump --force --opt --user=$user --password=$password --databases $db > $backup_path/$db-$DATE.sql
done


# Make tarball of /
tar -cpzf $DESDIR/$FILENAME --directory=/ --exclude=proc --exclude=sys --exclude=dev/pts --exclude media --exclude=$DESDIR $SRCDIR
#END
