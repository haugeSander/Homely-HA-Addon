FROM node:18-alpine

# Install build dependencies
RUN apk add --no-cache python3 make g++

WORKDIR /app

# Copy the entire application
COPY rootfs/app /app

# Install dependencies
RUN npm install

# Build TypeScript
RUN npm run build

# Remove devDependencies
RUN npm prune --production

# Copy our add-on run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]