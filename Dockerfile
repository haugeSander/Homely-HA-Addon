# Place this Dockerfile in your repository root
FROM node:18-alpine

# Install build dependencies
RUN apk add --no-cache python3 make g++

WORKDIR /app

# First copy and build the homely-mqtt project
COPY homely-mqtt/package*.json ./
RUN npm install

COPY homely-mqtt/ ./
RUN npm run build
RUN npm prune --production

# Copy the add-on run script
COPY homely-mqtt-addon/run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]