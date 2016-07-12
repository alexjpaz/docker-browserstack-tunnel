dockerTag=alexjpaz/browserstack-tunnel
build:
	docker build -t $(dockerTag) .

runIt: build
	docker run --entrypoint /bin/sh -it $(dockerTag)
