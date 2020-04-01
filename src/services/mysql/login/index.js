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

    user: ({ email }) => {
      return new Promise((resolve, reject) => {
        connection.query(
          'SELECT email, nome, apelido, senha FROM garcon WHERE ativo = "true" AND email = ?',
          [email],
          (error, results) => {
            const { email: eMail, nome, apelido } = results[0];

            if (error) {
              errorHandler(error, 'Usuário não encontrado', reject);
              return false;
            }

            return resolve({ garcon: { nome, apelido, eMail } });
          }
        );
      });
    },
  };
};

module.exports = garcons;
