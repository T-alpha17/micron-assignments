#!/bin/bash 

echo "Enter the username:"
read username

if grep "$username" /etc/passwd; then 
	echo "User $username exists"
	
	if sudo grep "$username" /etc/shadow | cut -d: -f2 | grep '$'; then
		echo "Password is set for the user $username"
	else
		echo "Password is not set for the user $username"
	fi
else
	echo "User $username does not exist"
	echo "Creating User:"
	sudo useradd "$username"
	echo "User $username created"
fi
	
