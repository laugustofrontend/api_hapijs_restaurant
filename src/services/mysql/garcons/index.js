const garcons = deps => {
  const { connection, errorHandler } = deps;

  return {
    all: () => {
      return new Promise((resolve, reject) => {
        connection.query('SELECT * FROM garcon', (error, results) => {
          if (error) {
            errorHandler(error, 'Falha ao buscar todos os garçons', reject);
            return false;
          }

          return resolve({ garcon: results });
        });
      });
    },

    save: user => {
      return user;
    }
  };
};

module.exports = garcons;
