all: build install pull

stack:
	@docker build --tag=128.250.160.167:5000/lfmc-geoserver .
	@docker push 128.250.160.167:5000/lfmc-geoserver
		
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