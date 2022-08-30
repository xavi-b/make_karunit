# Clone
```
git clone --recurse-submodules git@github.com:xavi-b/make_karunit.git
```

# Dependencies
## Manjaro ARM
```bash
sudo pacman -Syu
sudo pacman -Sy \
qt5-base \
qt5-tools \
qt5-location \
qt5-multimedia \
qt5-connectivity \
qt5-quickcontrols \
qt5-quickcontrols2 \
qt5-serialport \
qt5-svg \
qt5-translations \
qt5-xmlpatterns \
qt5-declarative \
kirigami2 \
gcc \
make \
bluez-qt \
networkmanager-qt \
ttf-font-awesome

# Vosk dependency
sudo pacman -Sy install python3 ffmpeg
pip3 install vosk
pip3 install websockets
python3 -c 'from vosk import Model; model = Model(lang="fr")' # to download fr model
python3 -c 'from vosk import Model; model = Model(lang="de")' # to download de model
```

# Configure
https://gpswebshop.com/blogs/tech-support-by-os-linux/how-to-connect-an-usb-gps-receiver-with-a-raspberry-pi
```bash
sudo systemctl enable gpsd
sudo systemctl start gpsd
```

# Install
```bash
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/karunit_local.conf'
sudo ldconfig
qmake
make
sudo make install
```

# Autostart
```
mkdir -p /home/pi/.config/autostart/
cp karunit.desktop /home/pi/.config/autostart/.
```
