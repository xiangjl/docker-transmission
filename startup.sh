#!/bin/sh

if [ ! -d '/var/lib/transmission/.config/' ]; then
	tar zxvf /root/config.tar.gz
fi

/usr/bin/transmission-daemon --foreground --config-dir '/var/lib/transmission/.config/transmission-daemon/' --log-error
