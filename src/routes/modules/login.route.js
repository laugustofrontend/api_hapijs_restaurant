const db = require('../../services/mysql');

const client = (server) => {
  server.route({
    method: 'POST',
    path: '/login',
    handler: async (request, h) => {
      const { user } = request.payload;
      const garcon = await db.login().user(user);

      console.log('user params', user);
      return garcon;
    },
  });
};

module.exports = client;
