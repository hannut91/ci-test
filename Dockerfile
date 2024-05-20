FROM node:20.13.1-alpine3.18

WORKDIR /app

COPY node_modules /app/node_modules

COPY dist /app/dist

ENTRYPOINT [ "/app/node_modules/http-server/bin/http-server", "dist" ]
