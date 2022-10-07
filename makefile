BATCHID = foundBatchIDs.txt
DTN = dtn-itc.ifa.hawaii.edu
ARCHIVE = /bigdata/ps1/s27

all:
	bash ingest.sh $(BATCHID) ${DTN}:$(ARCHIVE)

clean:
	rm -rf B* *.csv
