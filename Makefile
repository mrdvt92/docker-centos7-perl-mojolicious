IMAGE_NAME=local/almalinux9-perl-mojolicious
CONTAINER_NAME=mojo
MOJO_LOG=/var/log/mojo.log

all:
	@echo "Syntax:"
	@echo "  make build   # builds the docker image from the Dockerfile as local/centos7-perl-mojolicious"
	@echo "  make run     # runs the docker image local/centos7-perl-mojolicious as mojo on http://127.0.0.1:5000/"
	@echo "  make rm      # stops and removes the image mojo"
	@echo "  make bash    # executes a bash shell on the running mojo container"
	@echo "  make log     # executes tail inside the mojo container on the log"

build:	Dockerfile my_app/
	docker build --rm --tag=$(IMAGE_NAME) .

run:
	docker run --detach --name $(CONTAINER_NAME) --publish 5000:8080 $(IMAGE_NAME)

bash:
	docker exec -it $(CONTAINER_NAME) /bin/bash

stop:
	docker stop $(CONTAINER_NAME)
	
rm:	stop
	docker rm $(CONTAINER_NAME)

log:
	docker exec -it $(CONTAINER_NAME) tail -f $(MOJO_LOG)
