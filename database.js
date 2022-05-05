var sqlite3 = require('sqlite3').verbose()
var md5 = require('md5')

const fs = require('fs');
const DBSOURCE = "db.sqlite"
const dataSql = fs.readFileSync('./data.sql').toString();
const dataArr = dataSql.toString().split(';');

let db = new sqlite3.Database('mydatabase', (err) => {
  if (err) {
    return console.error(err.message);
  }
  console.log('Connected to the SQLite database.');
});

db.serialize(() => {
  db.run('PRAGMA foreign_keys=OFF;');
  db.run('BEGIN TRANSACTION;');
  dataArr.forEach((query) => {
    if(query) {
      query += ';';
      db.run(query, (err) => {
         if(err) throw err;
      });
    }
  });
  db.run('COMMIT;');
});

db.close((err) => {
  if (err) {
    return console.error(err.message);
  }
  console.log('Closed the database connection.');
});