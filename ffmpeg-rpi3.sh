#!/bin/bash
sudo apt remove ffmpeg
sudo apt-get update && sudo apt-get upgrade -y
cd /usr/src
git clone git://git.videolan.org/x264
cd x264
./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
make -j4
sudo make install
cd /usr/src
git clone https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg
sudo apt-get install libomxil-bellagio-dev
sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree --enable-omx --enable-omx-rpi --enable-mmal
make -j4
sudo make install
sudo apt-get install -y nginx
mv /etc/nginx/nginx.conf /etc/nginx/nginx_default.conf
mv /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/default_old
curl https://raw.githubusercontent.com/Bigmanekb/nginx-conf/master/default -o /etc/nginx/sites-enabled/default
curl https://raw.githubusercontent.com/Bigmanekb/nginx-conf/master/nginx.conf -o /etc/nginx/nginx.conf
sudo /etc/init.d/nginx start
