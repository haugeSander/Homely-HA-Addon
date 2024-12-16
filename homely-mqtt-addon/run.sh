#!/usr/bin/with-contenv bashio

# Export environment variables from Home Assistant config
export HOMELY_USER="$(bashio::config 'HOMELY_USER')"
export HOMELY_PASSWORD="$(bashio::config 'HOMELY_PASSWORD')"
export MQTT_HOST="$(bashio::config 'MQTT_HOST')"
export MQTT_PORT="$(bashio::config 'MQTT_PORT')"
export MQTT_USER="$(bashio::config 'MQTT_USER')"
export MQTT_PASSWORD="$(bashio::config 'MQTT_PASSWORD')"

# Log environment variables for debugging (excluding passwords)
bashio::log.info "MQTT_HOST: ${MQTT_HOST}"
bashio::log.info "MQTT_PORT: ${MQTT_PORT}"
bashio::log.info "Starting Homely MQTT Bridge..."

cd /app
npm run start