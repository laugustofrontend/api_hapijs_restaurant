require('dotenv').config();

const Hapi = require('@hapi/hapi');

const { validate } = require('./helpers/validators');
const routes = require('./routes');

const init = async () => {
  const server = Hapi.Server({
    host: '0.0.0.0',
    port: process.env.APP_PORT,
    routes: { cors: true },
  });

  // eslint-disable-next-line global-require
  await server.register(require('@hapi/basic'));
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
