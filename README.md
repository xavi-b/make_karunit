# Dependencies
## Debian
```bash
sudo apt update && sudo apt install \
    qt5-default \
    libasound2-dev \
    libkf5bluezqt-dev \
    qtconnectivity5-dev \
    qtdeclarative5-dev \
    libkf5networkmanagerqt-dev \
    ofono \
    bluez \
    gpsd \
    fonts-font-awesome
```

# Configure
## Adafruit Ultimate GPS Hat
https://learn.adafruit.com/adafruit-ultimate-gps-hat-for-raspberry-pi/overview

# Install
```bash
sudo echo "/usr/local/lib" > /etc/ld.so.conf.d/karunit_local.conf
sudo ldconfig
qmake
make
sudo make install
```
