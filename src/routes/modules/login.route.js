const db = require('../../services/mysql');

const client = (server) => {
  server.route({
    method: 'POST',
    path: '/login',
    handler: async (request) => {
      const { user } = request.payload;
      const garcon = await db.login().user(user);

      return garcon;
    },
  });
};

module.exports = client;
