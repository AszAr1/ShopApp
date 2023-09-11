FROM node:20

WORKDIR "/docshopApp"

COPY package*.json ./

RUN yarn install

COPY . .

RUN yarn run build

CMD [ "yarn", "run", "start" ]

EXPOSE 3001