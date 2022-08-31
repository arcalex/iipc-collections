#!/bin/sh

# Set connector port

# Default: 8080

tail -n+2|grep -vE '^$'|cut -d, -f2,3|sed 's|,.*/|,|'|sort -t, -n|awk -F, '{printf("sed -i \"s,<Connector port=\\\"[^\\\|]\\+\\\",<Connector port=\\\"%d\\\",\" /srv/iipc-collections/%s/solrwayback_package/apache-tomcat/conf/server.xml\n",40000+NR-1,$2)}'
