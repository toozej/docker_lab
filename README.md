# docker_lab

A home for Docker (largely docker-compose) projects, Dockerfiles, scripts, and other whale-related stuff

## ./scripts/
A collection of useful utility scripts:
- `stop_docker.sh` & `restart_docker.sh`: find and stop/restart docker-compose projects
- `pull_docker_images.sh`: pull specific docker images from the [Docker Hub](https://hub.docker.com)
    - intended to be used with cron to poll for new updates to images on a schedule 
      (like after backing up currently running docker-compose projects and restarting them with fresh images)
- `backup_docker.sh`: safely backup docker-compose projects, including mounted data volumes
    - can be found at [toozej/backup_scripts/backup_docker.sh](https://github.com/toozej/backup_scripts/blob/master/backup_docker.sh) 
