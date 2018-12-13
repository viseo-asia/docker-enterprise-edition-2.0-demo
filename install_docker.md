## Create a new Virtual Machine with Docker Enterprise Edition installed

1. `vagrant up`
2. `vagrant ssh`
3. If this is a new VM update, upgrade and reboot:
  - `sudo apt-get update && sudo apt-get dist-upgrade -yy`
  - `sudo apt-get install ntpdate && sudo ntpdate pool.ntp.org && exit`
  - `vagrant reload`
  - `vagrant ssh`
3. Export your Docker EE URL, example:
  - `export DOCKER_EE_URL=<https://storebits.docker.com/ee/ubuntu/sub-xxxxx-xxxxx-xxxxx-xxxx-xxxxx-xxx>`
4. `sh /vagrant/install_docker.sh`
5. Reboot (sanity check that all is good)
  - `exit`
  - `vagrant reload`
  - `vagrant ssh`
  - Confirm all is good run: `docker version`
7. Install Docker UCP

```
docker container run --rm -it --name ucp \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker/ucp:3.1.0 install \
  --host-address 192.168.88.10 \
  --admin-username admin \
  --admin-password password
```

5. Login to UCP at [https://192.168.88.10](https://192.168.88.10) with user/pass **admin/password**
