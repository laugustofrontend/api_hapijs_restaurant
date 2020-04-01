const bcrypt = require('bcrypt');

const encryptPassword = (pass) => bcrypt.hashSync(pass, 10);

const comparePassword = (rawPass, hash) => bcrypt.compareSync(rawPass, hash);

module.exports = {
  encryptPassword,
  comparePassword,
};
