#!/bin/bash

# Install needed developer libraries
sudo apt-get install libgmp-dev zlib1g-dev libgl1-mesa-dev libglc-dev freeglut3-dev libedit-dev libglw1-mesa-dev libglw1-mesa

# Remove old tmp folder
sudo rm -r tmp
mkdir tmp

# Create symlink if necessary
libgmp=/usr/lib/libgmp.so.3
if [ ! \( -e "$libgmp" \) ]
then
    sudo ln -s /usr/lib/x86_64-linux-gnu/libgmp.so.10.0.5 $libgmp
fi


# Download the ghc
output_ghc_archive="tmp/ghc-7.6.3.tar.bz2"
output_ghc="tmp/ghc-7.6.3"
url=http://www.haskell.org/ghc/dist/7.6.3/ghc-7.6.3-x86_64-unknown-linux.tar.bz2
wget $url -O $output_ghc_archive


# Unpack and remove archive
tar -xjvf $output_ghc_archive -C "tmp/"
rm $output_ghc_archive


# Configure and install
cd $output_ghc
./configure
sudo make install


# Remove ghc installation files
cd ../..
sudo rm -r $output_ghc


# Download the haskell platform
output_hp_archive="tmp/haskell-platform-2013.2.0.0.tar.gz"
output_hp="tmp/haskell-platform-2013.2.0.0"
url2=http://lambda.haskell.org/platform/download/2013.2.0.0/haskell-platform-2013.2.0.0.tar.gz
wget $url2 -O $output_hp_archive


# Unpack and remove archive
tar -xzf $output_hp_archive -C "tmp/"
rm $output_hp_archive


# Configure and install
cd $output_hp
./configure
make
sudo make install


# Remove haskell platform installation files
cd ../..
sudo rm -r $output_hp


# Remove this tmp folder
sudo rm -r tmp

