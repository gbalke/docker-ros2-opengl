# docker-drake-ros2-opengl
`Dockerfile` and `docker-compose.yml` for enabling OpenGL applications to run locally in an environment with the latest drake (nightly) & ros2 (rolling) builds.

This is meant to be run on a system with an NVIDIA GPU as their GLVND docker container is the centerpiece to this all working.

## Setup
__NOTE__: Make sure to have docker-compose `1.28+` for GPU passthrough. Ubuntu 20.04 defaults to `1.25` I believe. I have used `1.29.1` which is the default in [this guide](https://docs.docker.com/compose/install/).

You will need to [install nvidia's container toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html).

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

When running ssh, make sure to use the `-C` option to disable compression. __If this is not added, framerate will be abysmal.__ Your command should look something like:
```bash
ssh user@host:port -X -C
```
Keep in mind you can add these options to your `~/.ssh/config` file so you don't have to remember to type it every time.

__NOTE__: Re-run `docker-compose up -d` each time you ssh to the server as it will need to grab the updated .Xauthority file. This must be run from a direct SSH (`tmux` and other local bash session managers will not properly transfer `$DISPLAY`).

## Testing
As this is quite complicated and a bit tricky to set up, make sure to test that everything is working correctly by running `glxgears` in the docker container after opening a bash session. The `glxgears` demo should render in a local window!
