#!/usr/bin/with-contenv bashio

# Create config directory and file
mkdir -p /app/config
cat > /app/config/default.json << EOF
{
    "logLevel": "info",
    "homely": {
        "user": "$(bashio::config 'HOMELY_USER')",
        "password": "$(bashio::config 'HOMELY_PASSWORD')"
    },
    "mqtt": {
        "host": "$(bashio::config 'MQTT_HOST')",
        "port": $(bashio::config 'MQTT_PORT'),
        "user": "$(bashio::config 'MQTT_USER')",
        "password": "$(bashio::config 'MQTT_PASSWORD')"
    }
}
EOF

cd /app
npm run start