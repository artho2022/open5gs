#!/bin/bash
sudo apt-get install openssh-server git
sudo apt-get remove -y uhd
sudo apt-get remove libuhd-dev libuhd003 uhd-host -y
sudo apt-add-repository --remove "deb http://files.ettus.com/binaries/uhd/repo/uhd/ubuntu/trusty trusty main"
sudo add-apt-repository ppa:ettusresearch/uhd -y
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install python python-tk libboost-all-dev libusb-1.0-0-dev
#pour ubuntu 16 et 18
#sudo apt-get -y --allow-unauthenticated install libuhd-dev libuhd003 uhd-host
#pour ubuntu 20
sudo apt-get -y --allow-unauthenticated install libuhd-dev libuhd4.1.0 uhd-host
sudo uhd_images_downloader -t b2xx
sudo apt-get install cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev g++
sudo apt-get install linux-lowlatency
sudo apt-get install linux-image-`uname -r | cut -d- -f1-2`-lowlatency
sudo apt-get install linux-headers-`uname -r | cut -d- -f1-2`-lowlatency
git clone https://github.com/srsRAN/srsRAN.git
cd srsRAN
git checkout release_22_04_1
mkdir build
cd build
cmake ../
make
make test
sudo make install
sudo ldconfig
sudo make install
srsran_install_configs.sh user

#srsGUI
sudo apt-get install libboost-system-dev libboost-test-dev libboost-thread-dev libqwt-qt5-dev qtbase5-dev
git clone https://github.com/srsLTE/srsGUI.git
cd srsgui
mkdir build
cd build
cmake ../
make
make test
