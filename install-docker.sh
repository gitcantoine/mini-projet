#! /bin/bash
#

# add repo docker
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y

# Remove podman and buildah
dnf remove podman buildah -y

# Install docker, docker compose V2 and some stuff
dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin vim git -y

# Start and enable Docker service
systemctl enable --now docker.service

# enable user vagrant use docker
usermod -aG docker vagrant

# install student-list website 
git clone https://github.com/gitcantoine/student-list.git
docker build -t simple_api:v1 /home/vagrant/student-list/simple_api/
docker compose --file /home/vagrant/student-list/docker-compose.yml up -d

# Install a local registery docker and registery ui
git clone https://github.com/gitcantoine/registry-docker-ui.git
docker compose --file /home/vagrant/registry-docker-ui/docker-compose.yml up -d

# Configure firewalld
systemctl enable --now firewalld.service
firewall-cmd --add-service=http --permanent
firewall-cmd --add-port=5000-5001/tcp --permanent
firewall-cmd --add-port=8090/tcp --permanent
systemctl restart firewalld.service
systemctl restart docker.service

# Push simple_api image into local registry

docker tag simple_api:v1 localhost:5001/simple_api:local
docker push localhost:5001/simple_api:local
