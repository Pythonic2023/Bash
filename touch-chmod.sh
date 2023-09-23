#!/bin/bash

# Create file, provide executable permissions for user using chmod

read -p "Script name > " script_name

if [[ -z $script_name ]]; then
	echo "No script name provided" >&2
	exit 1
elif [[ -a $script_name ]]; then
	echo "$script_name exists" >&2
	exit 1
else
	touch $script_name && chmod u+x $script_name
	echo "#!/bin/bash" > $script_name
	echo "Creating file..."
	exit
fi
