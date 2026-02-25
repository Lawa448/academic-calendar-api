FROM node:20

WORKDIR /unsw-calendar-api

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

# USER root
CMD ["npm", "start"]