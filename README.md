# Docker SSH Tunnel

This repository contains a Dockerfile to build a SSH server only used to have a SSH tunnel.

By default, it will create a user `tunnel` with `tunnel` password.

## How to pull already built images?

If you don't want to build it, simply pull the image:

    sudo docker pull matttbe/docker-ssh-tunnel

## How to build?

By building it by yourself, you can change some options.

### Remove password authentification and only accept valid ssh keys
Simply edit the `Dockerfile` file, remove the block following this comment:

    # Create user 'tunnel' without access to a prompt

Then, uncomment the next block. Don't forget to add a correct `authorized_key` file next to your `Dockerfile`.

### Build docker image
Now you build the image by using `build.sh` script or:

    sudo docker build -t matttbe/janus-node .


## How to launch it?
You can simply launch it as any other docker image but don't forget to redirect ports, e.g.: you can use the port `1234`:

    sudo docker run -d -p 0.0.0.0:1234:22 -P --name ssh-tunnel matttbe/ssh-tunnel

