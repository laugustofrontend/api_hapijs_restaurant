/* eslint-disable global-require */
require('dotenv').config();

const Hapi = require('@hapi/hapi');
const Inert = require('@hapi/inert');
const Vision = require('@hapi/vision');
const HapiSwagger = require('hapi-swagger');

const { validate } = require('./helpers/validators');
const routes = require('./routes');
const Package = require('../package');

const init = async () => {
  const server = Hapi.Server({
    host: '0.0.0.0',
    port: process.env.APP_PORT,
    routes: { cors: true },
  });
  const swaggerOptions = {
    info: {
      title: 'Test API Documentation',
      version: Package.version,
    },
  };

  await server.register([
    require('@hapi/basic'),
    Inert,
    Vision,
    {
      plugin: HapiSwagger,
      options: swaggerOptions,
    },
  ]);
  server.auth.strategy('simple', 'basic', { validate });

  routes(server);

  await server.start();
  console.log('Server is running on => %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {
  console.log(err);
  process.exit(1);
});

init();
