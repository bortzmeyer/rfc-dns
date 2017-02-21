DOCS=draft-bortzmeyer-dns-1034bis draft-bortzmeyer-dns-1035bis
OLDDOCS=draft-bortzmeyer-dns-rfc-bis

all: ${OLDDOCS}.txt test

draft-bortzmeyer-dns-rfc-bis.txt: draft-bortzmeyer-dns-rfc-bis.xml
	xml2rfc $^

test:
	@for doc in ${DOCS}; do \
		rnv rfc-v3.rnc $${doc}.xml; \
	done
	@for doc in ${OLDDOCS}; do \
		rnv rfc.rnc $${doc}.xml; \
	done

clean:
	@for doc in ${DOCS} ${OLDDOCS}; do \
		rm -f $${doc}.html $${doc}.txt; \
	done
