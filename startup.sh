#!/bin/sh

if [ ! -d '/var/lib/transmission/config/' ]; then
	tar zxvf /docker/config.tar.gz -C /var/lib/transmission/
fi

exec /bin/bash -c "/usr/bin/transmission-daemon --foreground --log-error --config-dir /var/lib/transmission/config/"
