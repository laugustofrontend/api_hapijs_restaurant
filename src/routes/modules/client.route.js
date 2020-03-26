const db = require('../../services/mysql');

const client = (server) => {
  server.route({
    method: 'GET',
    path: '/clients',
    handler: async () => {
      const clients = await db.clients().all();
      return clients;
    },
  });
};

module.exports = client;
