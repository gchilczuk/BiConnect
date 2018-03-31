FROM node:latest

ADD package.json /tmp/package.json
WORKDIR /tmp
RUN yarn install
