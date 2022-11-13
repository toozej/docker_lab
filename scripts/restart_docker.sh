#!/bin/bash

# get today's date
_NOW=$(date +"%m_%d_%Y")

# variables
USERNAME=my_unix_username_here
HOSTNAME=$(hostname)
FAILED=''

for DIR in `find /home/${USERNAME}/docker/ -mindepth 1 -maxdepth 1 -type d`; do
	echo "working on: ${DIR}"

	# don't back up docker containers that have a .do_not_backup file
	if [ -e "${DIR}/.do_not_backup" ]; then
		echo "skipping backing up ${DIR}"
		continue
	fi

	# shutdown running docker container
	/usr/bin/docker compose -f ${DIR}/docker-compose.yml down
	if [ $? -ne 0 ]; then
		FAILED="${FAILED} shutting down ${DIR} docker container failed on ${_NOW}\n"
		# skip to next ${DIR}
		continue
	fi

	# start docker container
	/usr/bin/docker compose -f ${DIR}/docker-compose.yml up -d
	if [ $? -ne 0 ]; then
		FAILED="${FAILED} starting ${DIR} docker container failed on ${_NOW}\n"
	fi

done

if [ -n "${FAILED}" ]; then
	echo "Docker restart failed with output: ${FAILED}"
else
	echo "Docker restart finished successfully on ${_NOW}"
fi
