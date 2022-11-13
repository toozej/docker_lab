#!/bin/bash

# get today's date
_NOW=$(date +"%m_%d_%Y")

# variables
USERNAME=my_unix_username_here
HOSTNAME=$(hostname)
FAILED=''

for DIR in `find /home/${USERNAME}/docker/ -mindepth 1 -maxdepth 1 -type d`; do
	echo "working on: ${DIR}"

	# shutdown running docker container
	/usr/bin/docker compose -f ${DIR}/docker-compose.yml down --remove-orphans
	if [ $? -ne 0 ]; then
		FAILED="${FAILED} shutting down ${DIR} docker container failed on ${_NOW}\n"
		# skip to next ${DIR}
		continue
	fi
done

if [ -n "${FAILED}" ]; then
	echo "Docker stop failed with output: ${FAILED}"
else
	echo "Docker stop finished successfully on ${_NOW}"
fi
