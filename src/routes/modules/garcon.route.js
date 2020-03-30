const db = require('../../services/mysql');

const garcons = (server) => {
  server.route({
    method: 'GET',
    path: '/garcons',
    handler: async () => {
      return db.garcons().all();
    },
  });

  server.route({
    method: 'GET',
    path: '/garcons/{id}',
    handler: async (request) => {
      const { id } = request.params;

      return db.garcons().find('3');
    },
  });

  server.route({
    method: 'POST',
    path: '/garcons',
    handler: async (request) => {
      const user = db.garcons().save(request.payload.user);
      return user;
    },
  });

  server.route({
    method: 'PUT',
    path: '/garcons',
    handler: (request) => {
      const user = db.garcons().update(request.payload.user);

      return user;
    },
  });

  server.route({
    method: 'DELETE',
    path: '/garcons',
    handler: (request) => {
      const user = db.garcons().delete(request.payload.user);

      console.log('Garcon ID => ', request.payload.user);
      return user;
    },
  });
};

module.exports = garcons;
