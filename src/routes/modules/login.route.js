const db = require('../../services/mysql');

const client = (server) => {
  server.route({
    method: 'POST',
    path: '/login',
    handler: async (request) => {
      const { user } = request.payload;

      return db.login().user(user);
    },
  });
};

module.exports = client;
