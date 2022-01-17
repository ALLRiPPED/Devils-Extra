#!/bin/bash

RPS_HOME='/home/pi/RetroPie-Setup'
if [ ! -z "$1" ];then
    RPS_HOME="$1"
fi
if [ ! -d "$RPS_HOME" ];then
    echo "RetroPie-Setup directory $RPS_HOME doesn't exist. Please input the location of RetroPie-Setup."
    echo "EX: ./install-extras.sh /home/pi/RetroPie-Setup/ext"
    exit
fi
if [ -d  "$RPS_HOME/ext/Devils-Extra" ]; then
    cd "$RPS_HOME/ext/Devils-Extra"
    git pull origin --force
else
    echo "Cloning Devils-Extra into $RPS_HOME"
    git clone https://github.com/Retro-Devils/Devils-Extra.git "$RPS_HOME/ext/Devils-Extra"
    sleep 1
fi
cp -f "$RPS_HOME/ext/Devils-Extra/platforms.cfg" "/opt/retropie/configs/all/platforms.cfg"
