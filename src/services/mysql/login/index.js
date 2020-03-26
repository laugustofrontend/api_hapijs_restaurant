const clients = (deps) => {
  const { connection, errorHandler } = deps;

  return {
    user: (user) => {
      const { login, password } = user;
      return new Promise((resolve, reject) => {
        connection.query(
          'SELECT cod_interno, nome FROM garcon WHERE ativo="true" AND apelido=? AND senha=?',
          [login, password],
          (error, results) => {
            if (error) {
              errorHandler(error, 'Falha ao buscar todos os clients', reject);
              return false;
            }

            return resolve({ clients: results });
          }
        );
      });
    },
  };
};

module.exports = clients;
