all: pull

build:
	@docker build -t anthonyrawlinsuom/lfmc-geoserver .

install:
	@docker push anthonyrawlinsuom/lfmc-geoserver
	
pull:
	@docker pull anthonyrawlinsuom/lfmc-geoserver
	
clean:
	@docker rmi --force anthonyrawlinsuom/lfmc-geoserver