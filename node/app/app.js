const express = require('express')
var request = require('request')
const app = express()

app.all('/storage*', function (req, res) {
  request({method: req.method, url: process.env.STORAGE_URL + req.url, json: req.body, headers: req.headers}, function (error, response, body) {
    res.send(body)
  });
})

app.all('/finance*', function (req, res) {
  res.send(req.headers)
  request({method: req.method, url: process.env.FINANCE_URL + req.url, json: req.body, headers: req.headers}, function (error, response, body) {
    res.send(body)
  });
})

app.all('/*', function (req, res) {
  request({method: req.method, url: process.env.PERSO_URL + req.url, json: req.body, headers: req.headers}, function (error, response, body) {
    res.send(body)
  });
})

app.listen(80)
