# Dependencies
## Raspbian testing
```bash
sudo echo "deb http://raspbian.raspberrypi.org/raspbian/ testing main contrib non-free rpi" >> /etc/apt/sources.list
sudo echo "deb http://archive.raspbian.org/raspbian/ testing main" >> /etc/apt/sources.list.d/raspi.list

sudo apt update && sudo apt install \
    qt5-default \
    libasound2-dev \
    libkf5bluezqt-dev \
    qtconnectivity5-dev \
    qtdeclarative5-dev \
    qtquickcontrols2-5-dev \
    qtpositioning5-dev \
    qtlocation5-dev \
    qtmultimedia5-dev \
    libqt5multimedia5-plugins \
    qml-module-qtquick-shapes \
    qml-module-qtquick-xmllistmodel \
    qml-module-qtquick-controls2 \
    qml-module-qtlocation \
    qml-module-qtpositioning \
    qml-module-qtmultimedia \
    libkf5networkmanagerqt-dev \
    ofono \
    bluez \
    gpsd \
    fonts-font-awesome \
    pulseaudio-module-bluetooth \
    bluez-tools \
    pavucontrol

sudo gpasswd -a pi pulse
sudo gpasswd -a pi lp
sudo gpasswd -a pulse lp
sudo gpasswd -a pi audio
sudo gpasswd -a pulse audio

sudo apt install network-manager --download-only
sudo apt purge openresolv dhcpcd5
sudo echo "[device]" > /etc/NetworkManager/conf.d/mac.conf
sudo echo "wifi.scan-rand-mac-address=no" >> /etc/NetworkManager/conf.d/mac.conf
sudo apt install network-manager
sudo systemctl restart NetworkManager

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
