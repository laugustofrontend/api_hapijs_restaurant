const validateUser = async (req, res) => {
  console.log('ValidateUser req => ', req);
  console.log('ValidateUser res => ', res);

  return true;
};

module.exports = {
  validateUser,
};
