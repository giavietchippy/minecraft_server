if [ ! -f server.jar ]; then
  curl -L -o server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar
fi

# Chấp nhận eula
echo "eula=true" > eula.txt

# Chạy server
echo "🚀 Starting Minecraft server..."
java -Xmx1G -Xms1G -jar server.jar nogui
