FROM node:12-alpine
RUN apk add --no-cache curl gnupg libstdc++

ENV APP_HOST 0.0.0.0
ENV APP_PORT 3000

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

CMD ["yarn", "start"]
