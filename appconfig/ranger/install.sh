#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

unattended=0
subinstall_params=""
for param in "$@"
do
  echo $param
  if [ $param="--unattended" ]; then
    echo "installing in unattended mode"
    unattended=1
    subinstall_params="--unattended"
  fi
done

default=y
while true; do
  if [[ "$unattended" == "1" ]]
  then
    resp=$default
  else
    [[ -t 0 ]] && { read -t 10 -n 2 -p $'\e[1;32mInstall ranger? [y/n] (default: '"$default"$')\e[0m\n' resp || resp=$default ; }
  fi
  response=`echo $resp | sed -r 's/(.*)$/\1=/'`

  if [[ $response =~ ^(y|Y)=$ ]]
  then

    sudo apt -y install ranger caca-utils libimage-exiftool-perl
    [ "$?" != "0" ] && echo "Something went while installing packages. Send this log to Tomas. Press enter to continue."; read

    # symlink vim settings
    rm ~/.config/ranger/rifle.conf
    rm ~/.config/ranger/commands.py
    rm ~/.config/ranger/rc.conf
    rm ~/.config/ranger/scope.sh

    mkdir ~/.config/ranger

    ln -fs $APP_PATH/rifle.conf ~/.config/ranger/rifle.conf
    ln -fs $APP_PATH/commands.py ~/.config/ranger/commands.py
    ln -fs $APP_PATH/rc.conf ~/.config/ranger/rc.conf
    ln -fs $APP_PATH/scope.sh ~/.config/ranger/scope.sh

    break
  elif [[ $response =~ ^(n|N)=$ ]]
  then
    break
  else
    echo " What? \"$resp\" is not a correct answer. Try y+Enter."
  fi
done
