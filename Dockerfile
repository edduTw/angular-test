FROM node:14-alpine as node
# Make /app as working directory
WORKDIR /app
# Copy the source code to the /app directory
COPY . .
# Install dependencies
RUN npm install
# Build the application
RUN npm run build  --prod

######  Use NgInx alpine image  ###### 
FROM nginx:1.17.1-alpine

COPY  --from=node /app/dist/apprancher  /usr/share/nginx/html