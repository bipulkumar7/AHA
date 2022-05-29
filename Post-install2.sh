#!/bin/bash
start=$(date +%s%N)
SCRIPT_VERSION=v2.0.0
WORKING_DIR='/home/ubuntu/'
URL='https://cdn.rstudio.com/connect/2022.05/rstudio-connect_2022.05.0~ubuntu20_amd64.deb'

# Put list of the packages here
package_list=( gdebi-core r-base )

Install_package ()
{
	# M>&N
	# "M" is a file descriptor, which defaults to 1, if not set.
	# "N" is another file descriptor
	# Moving in working dir
 	pushd $WORKING_DIR 2>&1> /dev/null
	
	# Checking working directory
	if [ "$PWD/" == $WORKING_DIR ]; then
		echo "Yes i'm in $PWDa ${array[@]} "
		
		#Updating repository	
		apt-get update 2>&1> /dev/null

		# Installing packages
		for packages in ${package_list[@]}
		  do
		      apt-get install $packages -y  2>&1>> log
	         done
	
	else
		echo "Fail to access $WORKING_DIR" 
		exit 1
	fi
	
	# Remove directories from the directory stack
	popd
	
}

Install_RstudioConnect ()
{	
	# Move to working directory
	pushd $WORKING_DIR 2>&1> /dev/null

	# Downloading Rstudio connect 2022.05.0
	wget $URL 2>&1>> log
	yes | gdebi rstudio-connect_2022.05.0~ubuntu20_amd64.deb 2>&1>> log

	
	# Remove directories from the directory stack
	popd
}


Install_package
Install_RstudioConnect
end=$(date +%s%N)
echo "Elapsed time: $(($(($end-$start))/1000000)) ms" > time
exit $?
