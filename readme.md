Birds search Up using Sinatra App + Solr + Redis

Preparing the Solr data is not part of this sample, it is done via  a node js script and
is described in here:
https://github.com/AvnerCohen/birds-search

This one assumes Solr is up with related data and is a simple usage of Solr and Sinatra

The process is a simple paginatation support on Solr results.
Data is also persisted into redis for a cachehit vs. solr hit testing.
