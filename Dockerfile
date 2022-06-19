FROM node:16.15

WORKDIR /app
COPY package.json /app
COPY package-lock.json /app

RUN npm install --omit=dev

COPY . /app

CMD npm start