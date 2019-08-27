# docker_lab

A home for Docker (largely docker-compose) projects, Dockerfiles, scripts, and other whale-related stuff

## ./scripts/
A collection of useful utility scripts to:
- find and stop/restart docker-compose projects
- pull specific docker images from the [Docker Hub](https://hub.docker.com)
    - intended to be used with cron to poll for new updates to images on a schedule 
      (like after backing up currently running docker-compose projects and restarting them with fresh images)
