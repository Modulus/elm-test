# base image
FROM node:10.15-jessie as build

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV BACKEND_DOMAIN=$BACKEND_PORT
ENV BACKEND_PORT=$BACKEND_PORT

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY . . 

RUN  npm install create-elm-app -g  --loglevel verbose


# Build app
CMD elm-app start