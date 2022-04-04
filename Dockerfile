FROM node:16.14-alpine3.15

RUN GRPC_HEALTH_PROBE_VERSION=v0.4.5 && \
  wget -qO /bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
  chmod +x /bin/grpc_health_probe

WORKDIR /source

ADD build src
ADD node_modules node_modules
ADD package.json package.json

ENTRYPOINT [ "node", "./src/main/index.js" ]