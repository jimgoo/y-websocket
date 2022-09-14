build:
	docker build -t y-websocket:latest -f Dockerfile .

push:
	docker tag y-websocket:latest gcr.io/ml-api-jimgoo/y-websocket:latest
	docker push gcr.io/ml-api-jimgoo/y-websocket:latest