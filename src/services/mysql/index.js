const mysqlServer = require('mysql');

const connection = mysqlServer.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
});

connection.connect((error) => {
  if (error) {
    console.log('error connection: ', error.stack);
    throw error;
  }
});

connection.on('error', (err) => {
  console.log('caught this erro => ', err.toString());
});

const errorHandler = (error, msg, rejectFunction) => {
  console.log('errorHandler => ', error);
  rejectFunction({ error: msg });
};

const loginModule = require('./login')({ connection, errorHandler });
const garconModule = require('./garcons')({ connection, errorHandler });

module.exports = {
  login: () => loginModule,
  garcons: () => garconModule,
};
