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

sudo cp karunit_gpsd.service /etc/systemd/system/.
sudo systemctl enable karunit_gpsd
sudo systemctl start karunit_gpsd
```

# Configure
## Adafruit Ultimate GPS Hat
https://learn.adafruit.com/adafruit-ultimate-gps-hat-for-raspberry-pi/overview

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
