all:
	@echo "Syntax:"
	@echo "  make build   # builds the docker image from the Dockerfile as local/docker-centos7-perl-mojolicious"
	@echo "  make run     # runs the docker image local/docker-centos7-perl-mojolicious as mojo on http://127.0.0.1:5000/"
	@echo "  make rm      # stops and removes the image mojo"
	@echo "  make bash    # executes a bash shell on the running mojo container"
	@echo "  make log     # executes tail inside the mojo container on the log"

build:	Dockerfile my_app.sh my_app/
	docker build --rm --tag=local/docker-centos7-perl-mojolicious .

run:
	docker run --detach --name mojo --tmpfs /run --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --publish 5000:8080 local/docker-centos7-perl-mojolicious

bash:
	docker exec -it mojo /bin/bash

rm:	
	docker stop mojo
	docker rm mojo

shell:
	docker exec -it mojo /bin/bash

log:
	docker exec -it mojo tail -f /var/log/mojo.log
