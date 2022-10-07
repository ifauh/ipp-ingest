# ipp-ingest
Ingest batch from IPP

Create a file with batch IDs e.g.
    /data/ipp113.0/datastore/dsroot/PSPS_PV3_P2_SLICE_19/B03019953/

Run using makefile
    make BATCHID=\<name of batch id file\> DTN=\<fqdn host name or IP\> ARCHIVE=\<path on data transfer node\>

Run by hand:
    bash ingest.sh foundbatchIDs.txt dtn-itc.ifa.hawaii.edu:/bigdata/ps1/s27

Clean up batch files, etc

    make clean
