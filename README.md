# Student-list

This repository is a POC of the deployment of the "Student-list" application with docker.

# Requirements

- VirtualBox, Vagrant and git
- 2 Go RAM available
- 2 CPU 
- 25 Go disk free

# How to test

clone this repo:
```bash
git clone https://github.com/gitcantoine/mini-projet.git
```


then:
```bash
cd mini-projet && Vagrant up
```
The script `install-docker.sh' will install "Student-list" and "docker registry" from the following repository:
- [https://github.com/gitcantoine/student-list](https://github.com/gitcantoine/student-list)
- [https://github.com/gitcantoine/registry-docker-ui](https://github.com/gitcantoine/registry-docker-ui)


you will find Student-list application:  
[http://192.168.56.60](http://192.168.50.60)

you can manage the local conainter registry at:  
[http://192.168.56.60:8090](http://192.168.50.60:8090)
