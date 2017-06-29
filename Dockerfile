FROM node:6.10.3

# Download dependencies.
RUN apt-get -qq update
RUN apt-get install -y -qq curl
RUN apt-get install -y -qq nodejs
# RUN apt-get install -y -qq git
RUN npm install -g grunt-cli
RUN npm install -g bower

USER node

# Placeholders where we'll copy the packages into later
# We need to create them before mounting volumes in order to keep the right permissions (otherwise they're "root" owned)
RUN mkdir -p /home/node/.npm/
RUN mkdir -p /home/node/app/node_modules
RUN mkdir -p /home/node/app/bower_components

WORKDIR /home/node/app

ENV DEBUG=5858 PORT=9001
EXPOSE $DEBUG $PORT