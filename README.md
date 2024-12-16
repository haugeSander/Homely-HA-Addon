# Homely to MQTT Add-on for Home Assistant 🏠 📡

This Home Assistant add-on allows you to integrate your Homely devices with Home Assistant through MQTT, without needing to modify your Home Assistant OS installation or create separate Docker containers.

## Features

- Automatic discovery and creation of Homely devices in Home Assistant
- Real-time state updates through WebSocket connection
- Persistent device information storage using SQLite
- Easy configuration through the Home Assistant UI
- Supports various Homely devices including:
  - Sensors
  - Alarms (status only)
  - Motion detectors
  - Other Zigbee devices supported by the Homely API

## Prerequisites

- Home Assistant OS installed
- MQTT Add-on installed and configured in Home Assistant
- Valid Homely account credentials
- Homely Hub connected and operational

## Installation

1. Add this repository to your Home Assistant Add-on Store:
   ```
   https://github.com/haugeSander/Homely-HA-Addon
   ```

2. Install the "Homely-HA-Addon" add-on from the Add-on Store

3. Configure the add-on (see Configuration section below)

4. Start the add-on

## Configuration

Configure the add-on through the Home Assistant UI by setting the following options:

```yaml
homely:
  username: "your.email@example.com"
  password: "your-homely-password"
mqtt:
  host: "core-mosquitto"  # Use this if using the Mosquitto add-on
  port: 1883
  username: "mqtt-user"
  password: "mqtt-password"
```

## Supported Devices

This add-on supports all devices that are accessible through the Homely API. However, please note the following limitations:

- The integration is read-only (you cannot control devices through Home Assistant)
- Some devices may not be available through the API, including:
  - Yale Doorman
  - Alarm Panel
  - Other vendor-specific devices

## Device Discovery

Devices are automatically discovered and created in Home Assistant using MQTT discovery. Each device will appear with appropriate entities based on its capabilities.

## Troubleshooting

### Common Issues

1. Add-on won't start:
   - Verify your Homely credentials
   - Check MQTT connection details
   - Review the add-on logs

2. Devices not appearing:
   - Ensure devices are properly paired with your Homely Hub
   - Check MQTT topics in Home Assistant
   - Verify MQTT discovery is enabled in Home Assistant

### Logs

To view detailed logs:
1. Go to the add-on page in Home Assistant
2. Click on the "Log" tab
3. Look for any error messages or warnings

## Contributing

This project is open source! Feel free to contribute by:
- Reporting bugs
- Suggesting features
- Submitting pull requests

## Credits

This add-on is based on the [homely-mqtt](https://github.com/yusijs/homely-mqtt/tree/main) project, adapted to work as a Home Assistant add-on.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Disclaimer

This is a community project and is not affiliated with Homely or Home Assistant. Use at your own risk.