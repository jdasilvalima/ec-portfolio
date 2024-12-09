FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5173

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=5173

CMD [ "npm", "run", "dev" ]