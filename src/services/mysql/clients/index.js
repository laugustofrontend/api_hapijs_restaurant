const clients = (deps) => {
  const { connection, errorHandler } = deps;

  return {
    all: () => {
      return new Promise((resolve, reject) => {
        connection.query('SELECT * FROM clientes', (error, results) => {
          if (error) {
            errorHandler(error, 'Falha ao buscar todos os clients', reject);
            return false;
          }

          return resolve({ clients: results });
        });
      });
    },
  };
};

module.exports = clients;
