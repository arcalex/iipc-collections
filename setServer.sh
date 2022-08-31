#!/bin/sh

# Clear shutdown port (process kill will be required to shut down)

# Default: 8005

tail -n+2|grep -vE '^$'|cut -d, -f2,3|sed 's|,.*/|,|'|sort -t, -n|awk -F, '{printf("sed -i \"s,^<Server port=\\\"[^\\\"]\\+\\\",<Server port=\\\"-1\\\",\" /srv/iipc-collections/%s/solrwayback_package/apache-tomcat/conf/server.xml\n",$2)}'
