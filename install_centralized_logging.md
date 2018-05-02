# Install Centralized Logging

Send container logs to scalyr.com.

Sign up for a 30 day trial at scalyr.com if you don't have an account there already.

1. As per the setup docs at scalyr, create a configuration file snippet to hold your api key. 

In this example, create in the VM `/home/ubuntu/scalyr_api_key.json` and chmod it to 600 (read only)

Example: 

```
{ 
  api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
```

2. `docker pull scalyr/scalyr-docker-agent`
3. Run the scalyr agent

```
docker run -d --name scalyr-docker-agent \
-v /home/ubuntu/scalyr_api_key.json:/etc/scalyr-agent-2/agent.d/api_key.json \
-v /var/run/docker.sock:/var/scalyr/docker.sock \
-p 601:601 \
--restart always \
scalyr/scalyr-docker-agent
```

4. You should now see the container in the UCP web admin: [https://192.168.88.10:444/manage/resources/containers](https://192.168.88.10:444/manage/resources/containers)

Simple test container:

- `docker run  --log-driver=syslog --log-opt syslog-address=tcp://127.0.0.1:601 -d ubuntu /bin/sh -c 'while true; do echo Hello, World!; sleep 1; done'`
