#!/bin/bash

indexer="/srv/solrwayback/solrwayback_package/indexing/warc-indexer-3.2.0-SNAPSHOT-jar-with-dependencies.jar"

for f in "$@"; do
  echo "processing file $f..."

  c=$(dirname "$(readlink -f "$indexer")")/config3.conf

  basedir=$(dirname "$(dirname "$(readlink -f "$f")")")

  s="http://localhost:8983/solr/$(basename "$basedir")"

  # Does this look like a path to a GlusterFS brick?
  brick=$(dirname "$basedir")

  if [ "${brick#/data??}" = /brick ]; then
    tika_tmp="$brick/../local/tika_tmp"
  else
    tika_tmp=/tmp/tika_tmp
  fi

  java -Xmx1024M -Djava.io.tmpdir="$tika_tmp" -jar "$indexer" -c "$c" -s "$s" "$f"
done
