module.exports = {

  development: {
    client: 'pg',
    connection: {
      database: "teampicker"
    },
    migrations: {
      directory: "db/migrations"
    }
  }

};
