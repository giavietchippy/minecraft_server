#!/bin/bash
if [ ! -f server.jar ]; then
  echo "Downloading Minecraft server..."
  curl -o server.jar -L https://piston-data.mojang.com/v1/objects/95495a7f485edd84ce928cef5e223b757d2f764/server.jar
fi

java -Xmx1024M -Xms1024M -jar server.jar nogui
