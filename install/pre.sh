#!/bin/bash

wget http://www.cmake.org/files/v3.6/cmake-3.6.1.tar.gz
tar xvzf cmake-3.6.1.tar.gz
cd cmake-3.6.1
./bootstrap
make
make install 
cd ..
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sha256sum go1.13.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> /home/opc/.bash_profile
echo 'export GOPATH=/home/opc/go' >> /home/opc/.bash_profile
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> /home/opc/.bash_profile
source /home/opc/.bash_profile
PROTOC_ZIP=protoc-3.7.1-linux-x86_64.zip
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/$PROTOC_ZIP
sudo unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
sudo unzip -o $PROTOC_ZIP -d /usr/local 'include/*'
rm -f $PROTOC_ZIP
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y
sudo yum install git -y
mkdir -p /home/opc/go/src
mkdir -p /home/opc/go/pkg
mkdir -p /home/opc/go/bin
sudo yum -y install centos-release-scl
sudo yum -y install devtoolset-7
#sudo scl enable devtoolset-7 bash
echo '. /opt/rh/devtoolset-7/enable' >> /home/opc/.bash_profile
source /home/opc/.bash_profile
go get github.com/hdac-io/friday
cd /home/opc/go/src/github.com/hdac-io/friday
sudo npm install -g assemblyscript@0.9.1
make install
sudo systemctl stop firewall
sudo systemctl disable firewalld
