#!/bin/sh
koshu-inout.sh $* -o RDF4H.md     -x ttl -g rdf4h
koshu-inout.sh $* -o KOSHU-RDF.md koshu-rdf E01.ttl
