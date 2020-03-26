const path = require('path');

const loadRoutesByPath = require('./loadRoutesByPath');

const pathRoutes = path.join(__dirname, 'modules');

const routes = (server) => {
  loadRoutesByPath(server, pathRoutes);
};

module.exports = routes;
