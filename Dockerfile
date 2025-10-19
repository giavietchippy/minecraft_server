# Dockerfile - dùng OpenJDK 21
FROM openjdk:21-jdk-slim

# cài công cụ cần thiết
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl jq ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# copy toàn bộ repo vào container
COPY . .

# cấp quyền cho script
RUN chmod +x start.sh

EXPOSE 25565

CMD ["bash", "start.sh"]
