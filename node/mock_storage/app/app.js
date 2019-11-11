const express = require('express')
const app = express()

app.get('/storage/test.txt', function (req, res) {
  res.send('Storage 1')
})

app.get('/storage/test/test.txt', function (req, res) {
  res.send('Storage 2')
})

app.listen(80)
