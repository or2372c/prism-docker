# MultiMC in a docker container
This is a docker container that lets you run [Java Minecraft](https://www.minecraft.net) client with [MultiMC](https://multimc.org/). Ideal for modded AFK bots or baratone instances running on servers.

It's based on [baseimage-gui](https://github.com/jlesage/docker-baseimage-gui) which provides a VNC connection and a web interface.

# How?
### Clone the repo and build it.
```
git git clone https://github.com/45ninjas/multimc-docker.git
cd multimc-docker
docker build -t multimc .
```
### Docker hub Alternative
```
docker pull 45ninjat/multimc-client
```

### Run it
```
docker run --name multimc --rm -p 5800:5800 -p 5900:5900 -v "MULTIMC DIR:/config" -v "INSTANCES DIR:/config/multimc/instances" multimc
```

- Port 5800 for Web Interface. If you don't need the web UI, don't include it.
- Port 5900 for VNC. May have better mouse support. If you don't need a VNC connection don't include it.
- `/config` volume stores the directory multimc lives in. Docker will create it's own if not specified.
- `/instances` volume stores all the multmc instances. Docker will create it's own if not specified.


# Usage
Once the container is running you can access the web UI through `http://<HOSTNAME>:<PORT>` like http://localhost:5800.

VNC on port 5900 can be accessed via `vncviewer <HOSTNAME>`. If you've used a port in the range of 5900-5999 you need to specify the display `vncviewer <HOSTNAME>:<DISPLAY>`. To get the display `display = port - 5900`

# Mouse Input
Proper mouse input may or may not work [see here](https://github.com/TigerVNC/tigervnc/issues/619), It's more likely to function with a TigerVNC viewer.

In Minecraft, Go `Controls > Mouse Settings`

Set Raw Input to OFF and Sensitivity to 30%. The mouse may be jank but it's better than none.

# Security
Your **login credentials are stored on the filesystem** in the `/config` volume at `/config/multimc/accounts.json`. However this does allow copying your `accounts.json` from one install of multimc to another so you don't have to keep logging in.

By Default multimc-client is un-secured and **open to anyone with network access**. If wish to change it, read about [security](https://github.com/jlesage/docker-baseimage-gui#security) and [vnc password](https://github.com/jlesage/docker-baseimage-gui#vnc-password) in the [baseimage-gui](https://github.com/jlesage/docker-baseimage-gui) documentation.