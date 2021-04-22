# docker-drake-ros2-opengl
Dockerfile and docker-compose.py for enabling OpenGL applications to run locally in an environment with the latest drake/ros2 builds.

This is meant to be run on a system with an NVIDIA GPU as their GLVND docker container is the centerpiece to this all working.

## Setup
Make sure to have docker-compose `1.28+` for GPU passthrough.

## Remote Server
In addition, if using X11 Forwarding, you can run OpenGL apps over ssh from within the docker container.

Make sure these are set in the server's `/etc/ssh/sshd_config`:

```
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost no
```

__NOTE__: Re-run `docker-compose up -d` each time you ssh to the server as it will need to grab the updated .Xauthority file.
