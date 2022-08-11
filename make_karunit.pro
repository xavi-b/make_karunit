TEMPLATE = subdirs

SUBDIRS += \
    karunit  \
    karunit_alsa_sound  \
    karunit_assistant  \
    karunit_bluetoothmusic  \
    karunit_bluez  \
    karunit_camera  \
    karunit_google_contacts  \
    karunit_led_display  \
    karunit_nav  \
    karunit_ofono  \
    karunit_wifi  \
    karunit_wiringpi  \

CONFIG += ordered

OTHER_FILES += README.md
