# Docker container with RabbitMQ

### How to execute with docker compose

You should create a file named "docker-compose.yml" with the following content:
```
version: '3'

services:
  mq:
    image: hersonpc/rabbitmq
    hostname: mq
    ports:
      - "5672:5672"
      - "15672:15672"
      - "61613:61613"
    network_mode: "bridge"
    environment:
     - RABBITMQ_ERLANG_COOKIE=random_number
     - RABBITMQ_DEFAULT_USER=admin
     - RABBITMQ_DEFAULT_PASS=admin
     - RABBITMQ_USER=guest
     - RABBITMQ_PASSWORD=guest
     - CLUSTERED=true
```

