const express = require('express')
const app = express()

app.get('/app1/', function (req, res) {
  res.send('Hello World App1!\n')
})

app.listen(80);