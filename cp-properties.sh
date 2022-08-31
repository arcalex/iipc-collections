#!/bin/bash

cd /srv/iipc-collections/

for i in *; do
  sudo -u $i cp $i/solrwayback_package/properties/solrwayback{,web}.properties $i/

  sudo -u $i sed -i "s,^\(solr\.server\)=.*,\1=http://localhost:8983/solr/$i/," $i/solrwayback.properties
  sudo -u $i sed -i "s,^\(wayback\.baseurl\)=.*,\1=https://iipc-collections.bibalex.org/solrwayback/$i/solrwayback/," $i/solrwayback{,web}.properties
  sudo -u $i sed -i "/^wayback\.baseurl=/awebapp.baseurl=/solrwayback/$i/solrwayback/" $i/solrwaybackweb.properties
  sudo -u $i sed -i "s,^\(chrome\.command\)=.*,\1=/usr/lib64/chromium-browser/headless_shell," $i/solrwayback.properties
done
