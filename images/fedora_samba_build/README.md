# Fedora Samba build container

The Fedora based container provides a build environment for Samba.

I use the following bash script to execute the samba build container. You can modify the variables as required for your environment.

```
container_name=samba_build
samba_sources=/home/user/src/samba # Point to your samba sources on the machine
image_name=quay.io/spuiuk/fedora_samba_build:stable
cmd="podman"

# Check if container exists(running or exited). If not, call $cmd run
if ! $cmd ps -a --filter name=$container_name|grep $container_name
then
	$cmd run -it \
	--name $container_name \
	--hostname=$container_name \
	--volume $samba_sources:/data/samba \
	--cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
	--cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN\
	$image_name
# If container exists and is running, exec /bin/bash
elif $cmd ps|grep $container_name 2>/dev/null
then
	$cmd exec -it $container_name /bin/bash

# Else if container exists but is not running, then start and attach to it
else
	$cmd start $container_name
	$cmd attach $container_name

fi
```
