#!/bin/bash

# Adapted from code found at https://github.com/dbpedia/dbpedia-docs/blob/master/scripts/download/dbpedia_download.sh

URL=http://downloads.dbpedia.org/2016-04/core/

mkdir -p dbpedia
mkdir -p dbpedia/unused
cd dbpedia

#download all ttl files from URL
wget -q -O - $URL | sed 's/"/\n/g' | grep "ttl.bz2$" | sed "s|^|$URL|g" | xargs wget

# Move all the unused files
mv *_abstracts_* unused
mv revision_* unused
mv page_ids_* unused
mv labels_en_uris_* unused
mv homepages_* unused
mv images_* unused
mv *_links.* unused

