# Clone
```
git clone --recurse-submodules git@github.com:xavi-b/make_karunit.git
```

# Dependencies
## Raspbian
```bash
sudo apt update && sudo apt install -y \
    g++ \
    qtbase5-dev \
    qttools5-dev-tools \
    libasound2-dev \
    libkf5bluezqt-dev \
    qtconnectivity5-dev \
    qtdeclarative5-dev \
    qtquickcontrols2-5-dev \
    qtpositioning5-dev \
    qtlocation5-dev \
    qtmultimedia5-dev \
    libqt5multimedia5-plugins \
    libqt5serialport5-dev \
    libqt5svg5-dev \
    qml-module-qtquick-shapes \
    qml-module-qtquick-xmllistmodel \
    qml-module-qtquick-controls2 \
    qml-module-qtlocation \
    qml-module-qtpositioning \
    qml-module-qtmultimedia \
    libkf5networkmanagerqt-dev \
    qtdeclarative5-private-dev \
    qtbase5-private-dev \
    kirigami2-dev \
    ofono \
    bluez \
    gpsd \
    fonts-font-awesome \
    bluez-tools

sudo apt install network-manager --download-only -y
sudo apt purge openresolv dhcpcd5 -y
sudo mkdir -p /etc/NetworkManager/conf.d/
sudo sh -c 'echo "[device]" > /etc/NetworkManager/conf.d/mac.conf'
sudo sh -c 'echo "wifi.scan-rand-mac-address=no" >> /etc/NetworkManager/conf.d/mac.conf'
sudo apt install network-manager network-manager-gnome -y
sudo systemctl restart NetworkManager

sudo cp karunit_gpsd.service /etc/systemd/system/.
sudo systemctl enable karunit_gpsd
sudo systemctl start karunit_gpsd

sudo apt install autoreconf autoconf libtool libasound2-dev libbluetooth-dev libdbus-1-dev libfaad-dev libglib2.0-dev ofono-dev libsbc-dev
git clone git@github.com:raspberrypi-ui/bluealsa.git && cd bluealsa/
autoreconf --install
mkdir build && cd build
../configure --enable-ofono --enable-debug --enable-aplay
make -j4
sudo make install

sudo cp -f bluealsa.service /lib/systemd/system/bluealsa.service
sudo cp aplay.service /etc/systemd/system/.
sudo systemctl enable aplay
sudo systemctl start aplay
sudo cp ofonoplay.service /etc/systemd/system/.
sudo systemctl enable ofonoplay
sudo systemctl start ofonoplay

cp .asoundrc ~/.

sudo reboot
```

# Configure
## Bluetooth Audio Sink
https://www.raspberrypi.org/forums/viewtopic.php?f=38&t=247892&p=1513571
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
