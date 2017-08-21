#!/bin/bash
# The next command will backup the whole server to the root filesystem
find /backups/archives/* -mmin +60 -exec rm {} \;
find /backups/databases/* -mmin +60 -exec rm {} \;
