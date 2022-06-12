# Name

docker-centos7-perl-mojolicious - Dockerfile for Mojolicious PSGI server running on CentOS7 under Hypnotoad 

# Docker Image

This Docker image is built from the [Official CentOS 7 Docker Image](https://hub.docker.com/_/centos).

# Hypnotoad

[Mojo::Server::Hypnotoad](https://docs.mojolicious.org/Mojo/Server/Hypnotoad) is a full featured, UNIX optimized, pre-forking non-blocking I/O HTTP and WebSocket server, built around the very well tested and reliable Mojo::Server::Prefork, with IPv6, TLS, SNI, UNIX domain socket, Comet (long polling), keep-alive, multiple event loop and hot deployment support that just works. Note that the server uses signals for process management, so you should avoid modifying signal handlers in your applications.

# Entrypoint

/my_app.sh

# Mojo App

/my_app

# See Also

* [CentOS7-Systemd-Mojolicious](https://github.com/bislink/CentOS7-Systemd-Mojolicious)
