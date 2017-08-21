#!/bin/bash
#Purpose = Sync backup files to an another server
#START

rsync -a --bwlimit=5000 --hard-links --inplace /backups/archives/* {{ backup_user }}@{{ backup_server }}:{{ backup_location_archives }}
rsync -a --bwlimit=5000 --hard-links --inplace /backups/databases/* {{ backup_user }}@{{ backup_server }}:{{ backup_location_databases }}

#END
