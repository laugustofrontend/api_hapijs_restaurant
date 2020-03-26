const home = (server) => {
  server.route({
    method: 'GET',
    path: '/',
    handler: () => {
      return {
        message: 'Enjoy the silence...',
        version: '0.1.0',
      };
    },
  });
};

module.exports = home;
