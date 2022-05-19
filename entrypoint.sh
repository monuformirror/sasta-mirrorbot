#!/bin/sh

set -eu

bash -c  "nohup tail -f /root/.megaCmd/megacmdserver.log >&0 2>1"

if [[ -n "$RCLONE_CONF" ]]
then
  mkdir -p ~/.config/rclone
  echo "$RCLONE_CONF" > ~/.config/rclone/rclone.conf
fi

echo "$INPUT_COMMAND" > $HOME/shell.sh
echo "exit \$?" >> $HOME/shell.sh
cat $HOME/shell.sh
