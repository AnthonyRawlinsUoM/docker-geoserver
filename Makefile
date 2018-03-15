all: build

build:
	@docker build -t anthonyrawlinsuom/lfmc-geoserver .

install:
	@docker push anthonyrawlinsuom/lfmc-geoserver

clean:
	@docker rmi anthonyrawlinsuom/lfmc-geoserver