#!/bin/bash

touch /tmp/.backup_running

destination_dir="/var/local/minecraft/backups_restic"
export RESTIC_PASSWORD=password

echo "begun stop notifier, stopping in 10 minutes"
/usr/local/bin/minecraft_stop_notify
echo "stopping server"
#export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
#export XDG_RUNTIME_DIR=/run/user/1000
#su admininstrator -c "systemctl --user stop minecraft"
systemctl --user stop minecraft
echo "stopped server"

DATE=$(date | sed 's/ /_/g')

echo "making backup"
#mkdir /var/local/minecraft/backups
cp /opt/minecraft/server /var/local/minecraft/backups -R
cd /var/local/minecraft/backups
mv server "minecraft_backup_${DATE}"
restic backup --repo $destination_dir /var/local/minecraft/backups/minecraft_backup_${DATE}
rm /var/local/minecraft/backups/minecraft_backup_${DATE} -r
echo "made backup"
rm -f /tmp/.backup_running
