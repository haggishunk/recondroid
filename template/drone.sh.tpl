#!/bin/bash

# mount data volume
mkdir -p /mnt/${DRONE_DATA_VOLUME}
mount -o discard,defaults,noatime /dev/disk/by-id/scsi-0DO_Volume_${DRONE_DATA_VOLUME} /mnt/${DRONE_DATA_VOLUME}
echo "/dev/disk/by-id/scsi-0DO_Volume_${DRONE_DATA_VOLUME} /mnt/${DRONE_DATA_VOLUME} ext4 defaults,nofail,discard 0 0" | tee -a /etc/fstab

# install docker
apt update
apt install -y curl
curl -sSL https://get.docker.com | sh -

# add recondroid user
useradd -m recondroid
usermod -aG docker recondroid
mkdir /home/recondroid/.ssh
cp /root/.ssh/authorized_keys /home/recondroid/.ssh/authorized_keys
chown -R recondroid:recondroid /home/recondroid/.ssh
su recondroid

# run drone
docker run \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    --volume=/mnt/${DRONE_DATA_VOLUME}:/data \
    --env=DRONE_GITHUB_SERVER=https://github.com \
    --env=DRONE_GITHUB_CLIENT_ID=${DRONE_GITHUB_CLIENT_ID} \
    --env=DRONE_GITHUB_CLIENT_SECRET=${DRONE_GITHUB_CLIENT_SECRET} \
    --env=DRONE_RUNNER_CAPACITY=${DRONE_RUNNER_CAPACITY} \
    --env=DRONE_SERVER_HOST=${DRONE_SERVER_HOST} \
    --env=DRONE_SERVER_PROTO=https \
    --env=DRONE_RPC_SECRET=${DRONE_RPC_SECRET} \
    --env=DRONE_LOGS_DEBUG=${DRONE_LOGS_DEBUG} \
    --env=DRONE_TLS_AUTOCERT=true \
    --publish=80:80 \
    --publish=443:443 \
    --restart=always \
    --detach=true \
    --name=recondroid \
    drone/drone:1
