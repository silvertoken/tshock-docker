# tShock Docker App

A docker app to run the tShock server for Terraria.  Information on tshock can be found at the link below.
 
https://tshock.co/xf/index.php

----
**Initial run to generate world**

This will start the server in interactive mode and allow you to create a world.  It mounts all the volumes into directories under /opt/data/tshock.  It names the server in docker terraria to make it easier to manage.

`docker run -it -p 7777:7777 -v /opt/data/tshock/config:/config -v /opt/data/tshock/logs:/logs -v /opt/data/tshock/world:/world -v /opt/data/tshock/plugins:/plugins --name="terraria" silvertoken/tshock-docker`

**Autoload world name terraria and detach**

This command will autoload the world named terraria and detach from the process so it runs in the background.

`docker run -dit -p 7777:7777 -v /opt/data/tshock/config:/config -v /opt/data/tshock/logs:/logs -v /opt/data/tshock/world:/world -v /opt/data/tshock/plugins:/plugins silvertoken/tshock-docker -world /world/terraria.wld`
