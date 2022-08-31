#!/bin/bash

cd /srv/iipc-collections/

for i in *; do
  sudo -u $i sed -i \
    -e "s,kb_logo_desktop_blue\.svg,IIPC-logo.png," \
    -e "s,www\.kb\.dk,www.netpreserve.org," \
    -e "s,about_this_archive\.txt,about_$i.txt," $i/solrwaybackweb.properties
done
