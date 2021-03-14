FROM cimg/node:15.11.0

LABEL author="linostin"

WORKDIR /test-app

COPY package*.json ./

RUN sudo npm install

COPY . ./

CMD [ "npm", "start" ]