all: build install pull

stack:
	@docker build --tag=127.0.0.1:5000/lfmc-geoserver .
	@docker push 127.0.0.1:5000/lfmc-geoserver
		
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