const { encryptPassword } = require('../../../helpers');

const garcons = (deps) => {
  const { connection, errorHandler } = deps;

  return {
    all: () => {
      return new Promise((resolve, reject) => {
        connection.query('SELECT email, nome, apelido, ativo FROM garcon', (error, results) => {
          if (error) {
            errorHandler(error, 'Falha ao buscar todos os garçons', reject);
            return false;
          }

          return resolve({ garcons: results });
        });
      });
    },

    find: (id) => {
      return new Promise((resolve, reject) => {
        connection.query('SELECT email, nome, apelido, ativo FROM garcon WHERE codigo = ? ', [id], (error, results) => {
          if (error || results.affectedRows) {
            return errorHandler(error, `Falha ao localiza o garcon com id: ${id}`, reject);
          }

          return resolve({ garcon: results });
        });
      });
    },

    getGarcon: (email) => {
      return new Promise((resolve, reject) => {
        connection.query('SELECT codigo, nome, email, senha FROM garcon WHERE email = ?', [email], (err, results) => {
          if (err) {
            return errorHandler(err, 'Não foi possível localizar usuário', reject);
          }

          return resolve({ ...results[0] });
        });
      });
    },

    save: (user) => {
      const { email, nome, apelido, senha, ativo } = user;

      return new Promise((resolve, reject) => {
        connection.query(
          'INSERT INTO garcon (email, nome, apelido, senha, ativo) values (?, ?, ?, ?, ?)',
          [email, nome, apelido, encryptPassword(senha), ativo],
          (error, results) => {
            if (error) {
              errorHandler(error, 'Falha ao salva o garcon.', reject);
              return false;
            }

            return resolve({
              id: results.insertId,
              message: `${nome} salvo com sucesso!`,
            });
          }
        );
      });
    },

    update: (user) => {
      const { codigo, email, nome, apelido, senha, ativo } = user;

      return new Promise((resolve, reject) => {
        connection.query(
          'UPDATE garcon SET email = ?, nome = ?, apelido = ?, senha = ?, ativo = ? WHERE codigo = ?',
          [email, nome, apelido, encryptPassword(senha), ativo, codigo],
          (error, results) => {
            if (error || !results.affectedRows) {
              return errorHandler(error, `Falha ao atualizar o ${nome}`, reject);
            }

            console.log('UPDATE GARCON => ', results);

            return resolve({
              codigo,
              message: `${nome} atualizado com sucesso`,
            });
          }
        );
      });
    },

    delete: (user) => {
      const { id } = user;

      return new Promise((resolve, reject) => {
        connection.query('DELETE FROM garcon WHERE codigo = ?', [id], (error, results) => {
          if (error || !results.affectedRows) {
            return errorHandler(error, `Não foi possivel deletar o garcon com id: ${id}`, reject);
          }

          return resolve({
            codigo: id,
            message: 'Garçon deletado com sucesso!',
          });
        });
      });
    },
  };
};

module.exports = garcons;
