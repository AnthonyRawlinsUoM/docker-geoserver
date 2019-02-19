all: build install pull

stack:
	@docker build --tag=anthonyrawlinsuom/lfmc-geoserver .
	@docker push anthonyrawlinsuom/lfmc-geoserver
		
build:
	@docker build -t anthonyrawlinsuom/lfmc-geoserver .

install:
	@docker push anthonyrawlinsuom/lfmc-geoserver
	
pull:
	@docker pull anthonyrawlinsuom/lfmc-geoserver

release:
	./release.sh

clean:
	@docker rmi --force anthonyrawlinsuom/lfmc-geoserver