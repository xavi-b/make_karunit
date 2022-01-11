#!/bin/bash
# The original script: http://blog.mrverrall.co.uk/2013/01/raspberry-pi-a2dp-bluetooth-audio.html.

# Find the right sink with `pactl list sources short`.
PA_SINK="alsa_output.0.analog-stereo"
BT_MAC=$(echo "$NAME" | sed 's/:/_/g' | sed 's/\"//g')
BT_USER=pi

function log {
	echo "[$(date)]: $*" >> /var/log/a2dp-autoconnect
}

function checkSource {
	# Get the current sources
	local _sources=$(sudo su - "$BT_USER" -c "pactl list sources short")

	# Check if any sources are currently running and that our new device is valid.
	if [[ "$_sources" =~ RUNIING ]]; then
		log "Source is already RUNNING. Available sources:"
		log "$_sources"
		return
	fi

	if [[ ! "$_sources" =~ "$1" ]] ; then
		log "Unrecognized source. Available sources:"
		log "\n$_sources"
		return
	fi

	log "Validated new source: $1."
	echo "$1"
}

function setVolume {
	log "Setting volume levels."

	# Set our volume to max
	sudo su - "$BT_USER" -c "pacmd set-sink-volume 0 65537"
	sudo su - "$BT_USER" -c "amixer set Master 100%"
}

function connect {
	log "Connecting $1."

	# Connect source to sink
	sudo su - "$BT_USER" -c 'pactl load-module module-loopback source="$1" sink="$PA_SINK" rate=44100 adjust_time=0'
}

log "Change for device $BT_MAC detected, running $ACTION."

if [ "$ACTION" = "add" ]
then
	incoming=bluez_source."$BT_MAC"
	if [ ! -z $(checkSource "$incoming") ] ; then
		connect "$incoming"
		setVolume
	fi
fi
