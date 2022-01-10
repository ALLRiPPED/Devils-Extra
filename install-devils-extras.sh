#!/bin/bash

RPS_HOME='/home/pi/RetroPie-Setup/ext'
if [ ! -z "$1" ];then
    RPS_HOME="$1"
fi
if [ ! -d "$RPS_HOME" ];then
    echo "RetroPie-Setup directory $RPS_HOME doesn't exist. Please input the location of RetroPie-Setup."
    echo "EX: ./install-extras.sh /home/pi/RetroPie-Setup/ext"
    exit
fi

echo "Cloning Devils-Extra into $RPS_HOME"
git clone https://github.com/ALLRiPPED/Devils-Extra.git
echo "Running RetroPie-Setup"
sudo ~/RetroPie-Setup/retropie_setup.sh