const db = require('../../services/mysql');

const garcons = (server) => {
  server.route({
    method: 'GET',
    path: '/garcons',
    options: {
      auth: 'simple',
    },
    handler: async () => {
      return db.garcons().all();
    },
  });

  server.route({
    method: 'GET',
    path: '/garcons/{id}',
    options: {
      auth: 'simple',
    },
    handler: async (request) => {
      const { id } = request.params;

      return db.garcons().find(id);
    },
  });

  server.route({
    method: 'POST',
    path: '/garcons',
    options: {
      auth: 'simple',
    },
    handler: async (request) => {
      const user = db.garcons().save(request.payload.user);
      return user;
    },
  });

  server.route({
    method: 'PUT',
    path: '/garcons',
    options: {
      auth: 'simple',
    },
    handler: (request) => {
      const user = db.garcons().update(request.payload.user);

      return user;
    },
  });

  server.route({
    method: 'DELETE',
    path: '/garcons',
    options: {
      auth: 'simple',
    },
    handler: (request) => {
      const user = db.garcons().delete(request.payload.user);

      return user;
    },
  });
};

module.exports = garcons;
