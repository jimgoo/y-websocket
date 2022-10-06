VERSION ?= 0.1.0

build:
	docker build -t y-websocket:latest -t y-websocket:$(VERSION) -f Dockerfile .

push:
	docker tag y-websocket:latest gcr.io/ml-api-jimgoo/y-websocket:latest
	docker tag y-websocket:$(VERSION) gcr.io/ml-api-jimgoo/y-websocket:$(VERSION)
	docker push gcr.io/ml-api-jimgoo/y-websocket:latest
	docker push gcr.io/ml-api-jimgoo/y-websocket:$(VERSION)

run:
	docker run -p 1234:1234 -e HOST=0.0.0.0 -e DEBUG_MODE=true y-websocket:latest

