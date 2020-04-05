const Bcrypt = require('bcrypt');

const users = {
  laugusto: {
    username: 'john',
    password: '$2b$10$1NyPNsWYWG7C3SgheI/og.2RgsfkMorBW.GfN2GRtucJbEh.i2GQu',
    name: 'John Doe',
    id: '2133d32a',
  },
};

const validate = async (request, username, password) => {
  console.log('Validate User username => ', username);
  console.log('Validate User password => ', password);
  const user = users[username];

  if (!user) {
    return { credentials: null, isValid: false };
  }

  const isValid = await Bcrypt.compare(password, user.password);
  const credentials = { id: user.id, name: user.name };

  return {
    isValid,
    credentials,
  };
};

module.exports = {
  validate,
};
