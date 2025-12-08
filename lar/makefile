# =====================================================================
# author: Jean-Michel RICHER
# email: jean-michel.richer@univ-angers.fr
# date: January 2019
# =====================================================================

PROJECT_NAME=$(shell cat cfg/project.cfg | grep "^PROJECT_NAME=" | cut -d'=' -f2)
PROJECT_VERSION=$(shell cat cfg/project.cfg | grep "^PROJECT_VERSION=" | cut -d'=' -f2)
PROJECT_DIR=$(shell pwd)

TODAY=$(shell date +'%F_%H_%M_%S')
ARCHIVE="$(HOME)/export/$(PROJECT_NAME)_$(TODAY).tgz"
ARCHIVE_NO_RESULTS="$(HOME)/export/$(PROJECT_NAME)_$(TODAY)_no_results.tgz"

run:
	./run.sh

clean:
	./clean.sh

archive: clean
	@echo "- generate archive " ;\
	mkdir -p ~/export ;\
	date +'%F_%T' >timestamp ;\
	echo "file:\n$(ARCHIVE)" ;\
	mkdir -p `dirname $(ARCHIVE)` ;\
	cd .. ; \
	tar -czf $(ARCHIVE) $(PROJECT_NAME) ; \
	cd $(PROJECT_DIR) 
	
archive_no_results: 
	@echo "- generate archive with no results" ;\
	mkdir -p ~/export ;\
	date +'%Y/%m/%d %Hh%M' >timestamp ;\
	echo "file:\n$(ARCHIVE_NO_RESULTS)" ;\
	mkdir -p `dirname $(ARCHIVE_NO_RESULTS)` ;\
	cd .. ; \
	tar --exclude=results/* -czf $(ARCHIVE_NO_RESULTS) $(PROJECT_NAME)  ; \
	cd $(PROJECT_DIR) 
		
