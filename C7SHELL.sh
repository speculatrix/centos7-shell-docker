#!/bin/bash

if [ ! -f Dockerfile ] ; then
	echo "Error, please run BUILDME.sh first"
	exit 1
fi

# detect the user chosen
MYUSERNAME=$( awk '/RUN useradd/ {print $7}' < Dockerfile )

echo "Starting a centos7 shell for user $MYUSERNAME with /home/$MYUSERNAME mapped in"

docker run -i -t -v /home:/home "centos7-shell-$MYUSERNAME"

