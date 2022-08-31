#!/bin/bash

cd /srv/iipc-collections/

for i in *; do
  sudo -u $i cp /srv/solrwayback/iipc/about/about_$i.txt ./$i/solrwayback_package/apache-tomcat/webapps/solrwayback/WEB-INF/classes/
done
