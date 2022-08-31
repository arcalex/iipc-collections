#!/bin/bash

cd /srv/solrwayback/solrwayback_package/apache-tomcat/webapps/

for i in /srv/iipc-collections/*; do
  if ! [ -e "solrwayback#${i##*/}#solrwayback" ]; then
    sudo -u solrwayback ln -s "$i/solrwayback_package/apache-tomcat/webapps/solrwayback" "solrwayback#${i##*/}#solrwayback"
    sudo chgrp -R solrwayback "$i/solrwayback_package/apache-tomcat/webapps/solrwayback"
  fi
done
