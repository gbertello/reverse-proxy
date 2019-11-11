const express = require('express')
const app = express()

app.get('/cv', function (req, res) {
  res.send('cv')
})

app.get('/cv/lettre', function (req, res) {
  res.send('lettre')
})

app.get('/livres', function (req, res) {
  res.send('livres')
})

app.get('/piano', function (req, res) {
  res.send('piano')
})

app.listen(80)
