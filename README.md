# docker-test

Making environments for Atcoder by Github Actions

> [!TIP]
> Feature


- base image  
  - ubuntu:latest
- installed package  
  - tar
  - time  
  - vim  
  - tree  
  - git  
  - curl
  - openssh-server  
  
- ENTRYPOINT  
  <details>
    <summary>Detail</summary>

    ```bash
    #!/bin/bash
    set -e

    # copy pub_key
    if [ -f /authorized_keys ]; then
      mkdir -p /home/dev/.ssh
      cp /authorized_keys /home/dev/.ssh/authorized_keys
      chown -R dev:dev /home/dev/.ssh
      chmod 700 /home/dev/.ssh
      chmod 600 /home/dev/.ssh/authorized_keys
    fi

    # start sshd
    exec /usr/sbin/sshd -D
    ```
  </details>  

> [!TIP]
> How to use

Use example is tested in AWS EC2
##### 0. Assumptions
There is no authorized_keys for ssh in container image.  
So, need to put keys into ```/home/dev/.ssh``` ("dev" is user name).
  
And, can't overwrite ```CMD``` in Dockerfile,  
so using shell script after container start.

##### 1. Start container



<details>
    <summary>temp memo</summary>
    
    ```
    [ec2-user@ip-10-0-10-242 cpp-run]$ cat docker-compose.yaml
    services:
      cpp-ssh:
        image: ghcr.io/ky381011/cpp-env
        ports:
          - "2222:22"
        volumes:
          - type: bind
            source: ./authorized_keys
            target: /home/dev/.ssh/authorized_keys
    [ec2-user@ip-10-0-10-242 cpp-run]$ cat setting.sh
    #!/bin/bash
    set -e

    docker compose exec cpp-ssh bash -c "
      chown -R dev:dev /home/dev/.ssh && \
      chmod 700 /home/dev/.ssh && \
      chmod 600 /home/dev/.ssh/authorized_keys
    "
    [ec2-user@ip-10-0-10-242 cpp-run]$ ssh -p 2222 dev@localhost
    Welcome to Ubuntu 24.04.2 LTS (GNU/Linux 6.1.140-154.222.amzn2023.x86_64 x86_64)

    * Documentation:  https://help.ubuntu.com
    * Management:     https://landscape.canonical.com
    * Support:        https://ubuntu.com/pro

    This system has been minimized by removing packages and content that are
    not required on a system that users do not log into.

    To restore this content, you can run the 'unminimize' command.
    Last login: Sun Jun 15 21:41:02 2025 from 172.20.0.1
    dev@98af4a646e94:~$
    ```

</details>  

> [!TIP]
> Concept
### Concept
- Easy to rebuuild environment
- Secure
- Reuseful

> [!NOTE]
> Memo
