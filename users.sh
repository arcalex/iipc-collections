#!/bin/sh

tail -n+2|grep -vE '^$'|cut -d, -f2,3|sed 's|,.*/|,|'|awk -F, '{printf("useradd -u %d -d /srv/iipc-collections/%s %s\n",$1+100000,$2,$2)}'
