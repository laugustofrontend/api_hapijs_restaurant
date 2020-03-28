const db = require('../../services/mysql');

const garcons = server => {
  server.route({
    method: 'GET',
    path: '/garcons',
    handler: async () => {
      return db.garcons().all();
    }
  });

  server.route({
    method: 'POST',
    path: '/saveg',
    handler: async request => {
      return db.garcons().save(request.payload.user);
    }
  });
};

module.exports = garcons;
