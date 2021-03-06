#!/bin/bash

INSTALL_DIR=/usr/local/bin
TEMP_DIR=`mktemp -d /tmp/mochad.XXXXXX`
MOCHAD_bin=$INSTALL_DIR/mochad
mochad_url="http://downloads.sourceforge.net/project/mochad/mochad-0.1.17.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fmochad%2Ffiles%2F%3Fsource%3Dnavbar&ts=1481789127&use_mirror=freefr"

echo 1 > /tmp/compilation_Mochad_in_progress
echo "Installing additional libraries"
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes install libusb-1.0.0-dev
echo 10 > /tmp/compilation_Mochad_in_progress
echo "Getting mochad..."
cd $TEMP_DIR
sudo wget -q $mochad_url -O - | tar -zx
echo 15 > /tmp/compilation_Mochad_in_progress

cd mochad-0.1.17

echo "Compiliing mochad..." 
./configure 

echo 30 > /tmp/compilation_Mochad_in_progress
make
echo 70 > /tmp/compilation_Mochad_in_progress
sudo make install

echo 99 > /tmp/compilation_Mochad_in_progress

mkdir -p /etc/mochad
echo "v0.1.17" > /etc/mochad/mochad_VERSION
echo 100 > /tmp/compilation_Mochad_in_progress
rm /tmp/compilation_Mochad_in_progress
