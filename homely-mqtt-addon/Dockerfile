FROM node:18-alpine

# Install build dependencies
RUN apk add --no-cache python3 make g++

WORKDIR /app

# Copy the homely-mqtt submodule contents
COPY ../homely-mqtt/package*.json ./

# Install dependencies
RUN npm install

# Copy all source code from homely-mqtt
COPY ../homely-mqtt/ ./

# Build TypeScript
RUN npm run build

# Remove devDependencies
RUN npm prune --production

# Copy our add-on run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]