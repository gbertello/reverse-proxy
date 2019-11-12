const express = require('express')
const app = express()

app.get('/app2/', function (req, res) {
  res.send('Hello World App2!\n')
})

app.listen(80);