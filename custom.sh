#!/bin/bash

cd /srv/iipc-collections/

for i in *; do
  sudo -u $i sed -i \
    -e "s,^\(allow\.export\.warc\)=.*,\1=false," -e "s,^\(archive\.start\.year\)=.*,\1=2018," -e "s,^\(maps\.latitude\)=.*,\1=31.208889," -e "s,^\(maps\.longitude\)=.*,\1=29.909167," $i/solrwaybackweb.properties
done
