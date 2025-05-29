### Docker Commands
## Volumes

## Networks

## Containers

Start a container
- Running an image results in creation of container

Start a `image=mongo` container with volume mapped and with mapping the hostport 27017 mapping to container port 27017
```bash
docker run 
--env=HOME=/data/db 
--volume=/data/configdb 
--volume=/data/db 
--network=docker_default 
-p 27017:27017 
-d mongo:6.0.5
```

```bash
docker run -d \
-p 27017:27017 \
--name mongo-db-container \
mongo:6.0.5
```

Show runnig docker containers
```bash
docker ps
```
Show all docker containers
```bash
docker ps -a
```
Stop a container
```bash
TODO
```
Start a container
```bash
TODO
```
Delete a Container
```bash
docker container rm bf95c65dac1b
```

## Images
Delete an image
```bash
docker image rm ac6d1fdb43fd
```



