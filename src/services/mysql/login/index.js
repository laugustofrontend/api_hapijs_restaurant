const garcons = (deps) => {
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

    user: (user) => {
      const { login, password } = user;
      return new Promise((resolve, reject) => {
        connection.query(
          'SELECT cod_interno, nome FROM garcon WHERE ativo="true" AND apelido=? AND senha=?',
          [login, password],
          (error, results) => {
            if (error) {
              errorHandler(error, 'Falha ao selecionar o usuário', reject);
              return false;
            }

            return resolve({ garcon: results });
          }
        );
      });
    },
  };
};

module.exports = garcons;
