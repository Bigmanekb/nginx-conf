sudo apt remove ffmpeg
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
