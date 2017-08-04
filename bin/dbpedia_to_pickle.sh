#!/bin/bash

cd dbpedia

# Process all the ttl files
for file in *.ttl.bz2
do
	base="${file%.bz2}"
	rm -f "$base"

	mkdir -p "../tmp/$base"

	# Unzip
	bunzip2 -k "$file"

	# Split the file into sensibly sized chunks
	split -l 20000 "$base" "../tmp/$base/"

	# Extract the data
	../bin/dbpedia_to_pickle.py "../tmp/$base"
done
