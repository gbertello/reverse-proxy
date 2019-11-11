const express = require('express')
const app = express()
var basicAuth = require('express-basic-auth');

var users = [];
users['user'] = 'password';
app.use('/*', basicAuth({challenge: true, users: users}));

app.get('/finance', function (req, res) {
  res.send('finance')
})

app.get('/finance/account/Courant', function (req, res) {
  res.send('Courant')
})

app.get('/finance/max_date', function (req, res) {
  res.send('max date')
})

app.delete('/finance/transactions', function (req, res) {
  res.send('delete transactions')
})

app.post('/finance/transactions', function (req, res) {
  res.send('post transactions')
})

app.put('/finance/balances', function (req, res) {
  res.send('put balances')
})

app.listen(80)
