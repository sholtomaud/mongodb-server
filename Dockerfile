FROM node:4.4.7

RUN useradd --user-group --create-home --shell /bin/false app &&  npm install --global npm@3.10.5

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/mongodb-server/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/mongodb-server

RUN npm install --production

EXPOSE 8080
CMD [ "npm", "start" ]