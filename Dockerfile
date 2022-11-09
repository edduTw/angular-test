FROM node:14-alpine as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build  --prod


FROM nginx:1.17.1-alpine

COPY  --from=node /app/dist/apprancher  /usr/share/nginx/html