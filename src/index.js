require('dotenv').config();

const Hapi = require('@hapi/hapi');

const routes = require('./routes');

const init = async () => {
  const server = Hapi.Server({
    host: '0.0.0.0',
    port: process.env.APP_PORT,
    routes: { cors: true },
  });

  routes(server);

  await server.start();
  console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (error) => {
  console.log(error);
  process.exit(1);
});

init();
