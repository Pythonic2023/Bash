#!/bin/bash

# Recursivley backup $HOME directory with rsync

count=1
# List dir /mnt for backup point mount location
lm=$(ls /mnt)
# List block devices for finding backup drive
lsblk

read -p "select backup drive > " backup_drive

if [[ -b /dev/${backup_drive} ]]; then
	echo ""
	echo "$backup_drive online"
	echo ""
	
	# Create a numbered list of mount points to pick from	
	for location in $lm; do
		echo "($count) /mnt/$location"
		count=$((count+count))
	done	

	echo ""
	read -p "Select mount point for backup > " mount_point
	echo ""
	
	# If mount point selection is a directory then go ahead with mounting process, otherwise fail. 
	if [[ -d $mount_point ]]; then
		echo "Mounting $backup_drive to $mount_point"
		echo ""
		sudo mount "/dev/$backup_drive" "$mount_point"
		echo "Mounting complete, starting backup of $HOME to $backup_drive"
	else
		echo "Failed to mount" >&2
		exit 1
	fi
	
	# Begin backup, echo the string if backup completed.
	echo ""
	sudo rsync -av $HOME "$mount_point/$(date +%x)T14" && echo -e "\nBackup of $HOME finished"
	# Verify backup
	echo ""
	ls "${mount_point}"	

else
	echo "NO DRIVE" >&2
	exit 1
fi  


