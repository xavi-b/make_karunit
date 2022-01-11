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
    qml-module-qt-labs-settings \
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

sudo apt install -y --no-install-recommends bluez-tools pulseaudio-module-bluetooth
# sudo cp a2dp-autoconnect /usr/local/bin/a2dp-autoconnect
# sudo sh -c 'echo "KERNEL==\"input[0-9]*\", RUN+=\"/usr/local/bin/a2dp-autoconnect\"" > /etc/udev/rules.d/99-input.rules'
sudo sh -c 'echo "[General]" > /etc/bluetooth/audio.conf'
sudo sh -c 'echo "Class = 0x20041C" >> /etc/bluetooth/audio.conf'
sudo sh -c 'echo "Enable = Source,Sink,Media,Socket" >> /etc/bluetooth/audio.conf'
sudo sh -c 'echo "Class = 0x20041C" >> /etc/bluetooth/main.conf'

# Ofono
# https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Bluetooth/#usinghfpwithofono
# https://askubuntu.com/questions/845195/how-to-set-up-ubuntu-pc-as-bluetooth-headset-to-attend-calls
# https://wiki.archlinux.org/title/bluetooth_headset#Switch_between_HSP/HFP_and_A2DP_setting

sudo reboot
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
