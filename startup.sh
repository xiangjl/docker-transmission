#!/bin/sh

if [ ! -f '/transmission/settings.json' ]; then
	cp /docker/settings.json /transmission/settings.json
fi

exec /usr/bin/transmission-daemon --foreground --log-error --config-dir /transmission
