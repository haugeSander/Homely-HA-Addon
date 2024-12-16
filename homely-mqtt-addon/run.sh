# homeassistant-addon/run.sh
#!/usr/bin/with-contenv bashio

# Export Home Assistant config as environment variables
export HOMELY_USER="$(bashio::config 'HOMELY_USER')"
export HOMELY_PASSWORD="$(bashio::config 'HOMELY_PASSWORD')"
export MQTT_HOST="$(bashio::config 'MQTT_HOST')"
export MQTT_PORT="$(bashio::config 'MQTT_PORT')"
export MQTT_USER="$(bashio::config 'MQTT_USER')"
export MQTT_PASSWORD="$(bashio::config 'MQTT_PASSWORD')"

# Start the application using the existing entry point
npm start