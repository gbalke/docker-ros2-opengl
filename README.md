# docker-drake-ros2-opengl
Dockerfile and docker-compose.py for enabling OpenGL applications to run locally in an environment with the latest drake (nightly) & ros2 (rolling) builds.

This is meant to be run on a system with an NVIDIA GPU as their GLVND docker container is the centerpiece to this all working.

## Setup
__NOTE__:Make sure to have docker-compose `1.28+` for GPU passthrough. This is not the default. I have used 1.29.1 which is the default in [this guide](https://docs.docker.com/compose/install/).

Run `setup.sh` to build the container. This will also create a folder called `dev`. Anything placed in here will be available inside of the container.

## Use
Run `docker-compose up -d` to initialize the container. Once initialized, run `bash.sh` from as many terminals as you'd like to jump right into developing! ROS2 will already be sourced and drake will be pathed for `cmake`.

## Remote Server
In addition, if using X11 Forwarding, you can run OpenGL apps over ssh from within the docker container.

Make sure these are set in the server's `/etc/ssh/sshd_config`:

```
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost no
```

When running ssh, make sure to use the `-C` option to disable compression. __If this is not added, framerate will be abysmal.__

__NOTE__: Re-run `docker-compose up -d` each time you ssh to the server as it will need to grab the updated .Xauthority file.
