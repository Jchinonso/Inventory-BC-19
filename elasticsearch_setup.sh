#!/bin/bash
for entity in items storerooms vendors inventories
do
    echo  Configuring ${entity} index...
    curl -XDELETE http://localhost:27017/${entity}
    curl -XDELETE http://localhost:27017/_river/s83_${entity}
    curl -XPUT --data @config/search/${entity}/${entity}_mapping.json http://localhost:27017/${entity}
    curl -XPUT --data @config/search/${entity}/${entity}_river.json http://localhost:27017/_river/s83_${entity}/_meta
done

