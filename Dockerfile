FROM node:16.15

WORKDIR /app
COPY package.json /app
COPY package-lock.json /app

RUN npm install --only=prod

COPY . /app

CMD npm start