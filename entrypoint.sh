#!/bin/bash

set -e

bash -c  "nohup tail -f /root/.megaCmd/megacmdserver.log >&0 2>1" &
if [[ "$USERNAME" != "NOBODY" ]] && [[ "$PASSWORD" != "CHANGEME" ]]; then
    mega-login $USERNAME $PASSWORD
fi

if [[ "$*" == "" ]]; then
	echo "Please specify a valid megacli command"
    	exit 1
fi

if [[ -n "$RCLONE_CONF" ]]
then
  mkdir -p ~/.config/rclone
  echo "$RCLONE_CONF" > ~/.config/rclone/rclone.conf
  sh -c "rclone $*"
fi

sh -c "mega-$*"