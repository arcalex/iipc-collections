#!/bin/bash

cd /srv/iipc-collections

for i in *; do
  sudo -u "$i" sed -i "s,\".*/solrwayback\(web\)\?\.specialcollection\.properties\",\"/srv/iipc-collections/$i/solrwayback\1.properties\"," \
    "/srv/iipc-collections/$i/solrwayback_package/apache-tomcat/webapps/solrwayback/META-INF/context.xml"

  sudo -u "$i" sed -i -e "5s,.*,," -e "14s,.*,," \
    "/srv/iipc-collections/$i/solrwayback_package/apache-tomcat/webapps/solrwayback/META-INF/context.xml"
done
