DBPedia to Neo4J
================

This repo contains a (very early) attempt at putting together some scripts and recipes to enable the import of DBPedia data into the Neo4J graph database. It builds upon sterling work by:

- Jörg Baach http://www.baach.de/Members/jhb/dbpedia-and-neo4j-first-steps-ii/view
- DBPedia Docs https://github.com/dbpedia/dbpedia-docs/blob/master/scripts/download/dbpedia_download.sh

Caution: This can use quite a bit of disk space. It is recommended that you have at least ??? Gb free. Lots of memory is good too!


Follow these steps to get started:
----------------------------------

1. Install Neo4J

If you are running on Ubuntu, there are some good instructions at https://www.digitalocean.com/community/tutorials/how-to-install-neo4j-on-an-ubuntu-vps

2. Clone this repo

    git clone 

3. Install Python and Virtualenv

    pip install virtualenv

4. Install the required Python modules

    pip install -r requirements.txt

5. Adjust the configuration to suit your environment

Edit conf.py as needed, the details of each field are described as comments in the file itself.


Now for the core of this repo:
------------------------------

6. Download the DBPedia dump files

    ./bin/dbpedia_download.sh

7. Set up the Neo4J schema

    ./bin/neo4j_schema.py

8. Parse all the downloaded files and output pickle files of nodes and relations

    ./bin/dbpedia_to_pickle.py

9. Import all the nodes into Neo4J

    ./bin/import_nodes.py

10. Import all the relations into Neo4J

    ./bin/import_relations.py

11. Finally, add indexes to the schema

    ./bin/neo4j_indexes.py

Now you are ready to query that lovely data!


Other useful tools:
-------------------

There are some more handy tools that can help you:

- bin/neo4j_drop_indexes.py Removes the indexes from the Neo4J schema, to speed up importing data
- bin/neo4j_drop_tables.py Remove the tables from the Neo4J schema
- bin/neo4j_delete_relations.py Remove the relations from the Neo4J database
- bin/neo4j_delete_nodes.py Remove the nodes from the Neo4J database

