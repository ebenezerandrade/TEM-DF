#!/bin/bash

echo "Update: starting"
sudo apt-get update 
echo "Update: DONE"

echo "Install git: starting"
sudo apt-get -y install git 
echo "Install git: DONE"

echo "Installing rvm: starting"
sudo apt-get -y install curl 
sudo apt-get -y install gnupg2
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -L https://get.rvm.io | bash -s stable 
source ~/.rvm/scripts/rvm 
echo "Installing rvm: Done"

echo "Installing additional dependences: starting"
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get update 
sudo apt-get -y install nodejs 
echo "Installing additional dependences: DONE"

echo "Installing ruby and rails: starting"
rvm install 2.3.0p0
rvm use 2.3.0p0 --default
gem install bundler
gem install rails
echo "Installing ruby and rails: DONE"

echo "Instalation Complete!"