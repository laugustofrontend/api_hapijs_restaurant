const bcrypt = require('bcrypt');

const encryptPassword = (pass) => bcrypt.hashSync(pass, 10);

module.exports = {
  encryptPassword,
};
