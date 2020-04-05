const db = require('../../services/mysql');

const garcons = (server) => {
  server.route({
    method: 'GET',
    path: '/garcons',
    options: {
      auth: 'simple',
      description: 'Get Garçons',
      notes: 'Returns a list of garçons',
      tags: ['api'],
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
      description: 'Get Garçon',
      notes: 'Returns a garçon of passed id for path',
      tags: ['api'],
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
      description: 'Save Garçon',
      notes: 'Save garçon with values of payload',
      tags: ['api'],
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
      description: 'Update Garçon',
      notes: 'Update garçon with values passed of payload',
      tags: ['api'],
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
      description: 'Delete Garçon',
      notes: 'Delete Garçon of id passed for payload',
      tags: ['api'],
    },
    handler: (request) => {
      const user = db.garcons().delete(request.payload.user);

      return user;
    },
  });
};

module.exports = garcons;
