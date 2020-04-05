const Bcrypt = require('bcrypt');

const db = require('../services/mysql');

const validate = async (request, username, password) => {
  const user = await db.garcons().getGarcon(username);

  if (!user) {
    return { credentials: null, isValid: false };
  }

  const isValid = await Bcrypt.compare(password, user.senha);
  const credentials = { id: user.codigo, name: user.nome };

  return {
    isValid,
    credentials,
  };
};

module.exports = {
  validate,
};
