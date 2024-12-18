import { connect, IClientOptions, MqttClient } from 'mqtt';
import { logger } from './logger';
import dotenv from 'dotenv';
import config from 'config';
import { Config } from '../models/config';
import { DoneCallback } from 'mqtt/src/lib/shared';
import { IClientPublishOptions } from 'mqtt/src/lib/client';

dotenv.config();

const mqttConfig = config.get<Config['mqtt']>('mqtt');
const enabled = mqttConfig.enabled ?? true;

// Construct MQTT URL properly based on environment variables or config
let mqttUrl: string;
if (process.env.MQTT_HOST) {
  // If we have environment variables, construct the URL from them
  const host = process.env.MQTT_HOST;
  const port = process.env.MQTT_PORT || '1883';
  mqttUrl = `mqtt://${host}:${port}`;
} else if (mqttConfig.host) {
  // Use the config file URL if no environment variables
  mqttUrl = mqttConfig.host;
} else {
  logger.fatal('No MQTT host configuration found');
  process.exit();
}

// Merge authentication from environment variables and config
const mqttOptions: IClientOptions = {
  username: process.env.MQTT_USER ?? mqttConfig.user,
  password: process.env.MQTT_PASSWORD,
  log: (args) => logger.debug(args),
  will: {
    topic: 'homely/notice',
    payload: Buffer.from('Homely is offline'),
    qos: mqttConfig.qos ?? 1,
    retain: false,
  },
};

let mqttClient: MqttClient;

if (enabled) {
  logger.info(`Connecting to MQTT broker at ${mqttUrl}`);
  mqttClient = connect(mqttUrl, mqttOptions);
  
  mqttClient.on('connect', () => {
    logger.info('Successfully connected to MQTT broker');
  });
  
  mqttClient.on('error', (error) => {
    logger.error('MQTT connection error:', error);
  });
} else {
  // A mock instance of mqttClient for testing without sending any messages
  mqttClient = {
    publish: (
      topic: string,
      message: string | Buffer,
      opts?: IClientPublishOptions,
      callback?: DoneCallback
    ) => {
      let msg: object | string;
      try {
        msg = JSON.parse(message.toString());
      } catch {
        msg = message?.toString() ?? '';
      }
      logger.info({
        topic,
        message: msg,
        opts,
        callback,
      });
    },
  } as unknown as MqttClient;
}

export { mqttClient };

// Announce online status after connection is established
if (enabled) {
  mqttClient.on('connect', () => {
    mqttClient.publish('homely/notice', 'Homely is online');
  });
}