#!/bin/bash
#description=This stops all the dockers, and backs it up to the cache docker folder, then restarts all dockers

/usr/local/emhttp/webGui/scripts/notify -e "Stopping all Dockers" -i "normal" -s "Stopping all dockers for rsync at `date`"
docker stop $(docker ps -a -q) 

/usr/local/emhttp/webGui/scripts/notify -e "Rsync Backup" -i "normal" -s "Rsync backup of SSD Docker started at `date`"
rsync -a --progress /mnt/disks/CT1000MX500SSD1_1826E1468021/Docker/ /mnt/user/Docker |& logger
/usr/local/emhttp/webGui/scripts/notify -e "Rsync Backup" -i "normal" -s "Rsync backup of SSD Docker complete at `date`"

/usr/local/emhttp/webGui/scripts/notify -e "Starting all Dockers" -i "normal" -s "Starting all dockers for rsync at `date`"
docker start $(docker ps -a -q)

