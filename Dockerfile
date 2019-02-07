# base image
FROM node:10.15-jessie as build

# set working directory
RUN mkdir /usr/src/app && mkdir -p /usr/local/lib/node_modules/create-elm-app/node_modules/elmi-to-json/unpacked_bin
WORKDIR /usr/src/app

ENV BACKEND_DOMAIN=$BACKEND_PORT
ENV BACKEND_PORT=$BACKEND_PORT

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH
 
# install and cache app dependencies
COPY . . 

RUN  npm install -g create-elm-app -g --unsafe-perm=true

# Build app
#CMD BACKEND_URL=${BACKEND_DOMAIN}:${BACKEND_PORT} elm-app build

CMD elm-app build






FROM nginx:1.15.8 as web

COPY --from=build /usr/src/app/build /usr/share/nginx/html

EXPOSE 80