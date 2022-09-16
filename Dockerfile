FROM node:16.17.0-alpine

ENV NODE_ENV development

USER root

WORKDIR /usr/src/app

#COPY --chown=node:node ./bin ./bin
#COPY --chown=node:node ./controllers ./controllers
#COPY --chown=node:node ./libs ./libs
#COPY --chown=node:node ./routes ./routes
#COPY --chown=node:node ./views ./views
COPY --chown=node:node ./package.json ./package.json
COPY --chown=node:node ./app.js ./app.js

RUN npm install

EXPOSE 3010

USER node

CMD [ "node", "./app.js" ]
