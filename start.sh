#!/bin/bash
set -e

VER="1.21.10"

# cần jq
apt-get update -y
apt-get install -y jq curl

MANIFEST="https://launchermeta.mojang.com/mc/game/version_manifest_v2.json"

# lấy url thông tin phiên bản
ver_url=$(curl -s "$MANIFEST" | jq -r --arg v "$VER" '.versions[] | select(.id==$v) | .url')
if [ -z "$ver_url" ]; then
  echo "Version $VER not found"; exit 1
fi

# lấy link server.jar từ thông tin phiên bản
server_url=$(curl -s "$ver_url" | jq -r '.downloads.server.url')
echo "Downloading vanilla server from: $server_url"
curl -L -o server.jar "$server_url"

echo "eula=true" > eula.txt
java -Xmx1G -Xms1G -jar server.jar nogui
