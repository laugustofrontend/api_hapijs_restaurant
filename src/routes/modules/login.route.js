const db = require('../../services/mysql');
const { validateUser } = require('../../helpers/validators');

const client = (server) => {
  server.route({
    method: 'POST',
    path: '/login',
    config: {
      pre: [{ method: validateUser, assign: 'user' }],
    },
    handler: async (request) => {
      const { user } = request.payload;

      return db.login().user(user);
    },
  });
};

module.exports = client;
