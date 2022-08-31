#!/bin/bash

cd /srv/iipc-collections/

tomcat=8.5.60
solr=7.7.3

solrwayback=4.2.3

for i in *; do
  sudo -u $i unzip -d $i/ /srv/solrwayback/solrwayback_package_$solrwayback.zip
  sudo -u $i ln -s solrwayback_package_$solrwayback $i/solrwayback_package

  sudo -u $i ln -s apache-tomcat-$tomcat $i/solrwayback_package/apache-tomcat
  sudo -u $i ln -s solr-$solr $i/solrwayback_package/solr
done
