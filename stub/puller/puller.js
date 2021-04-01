const fs = require('fs')
const shell = require('shelljs')

const express = require('express')
const app = express()
const port = 9999

secret_key = 0

fs.readFile('secret_key/secret_key', 'utf8', (err, data)=>{
  secret_key = data;
})

app.use(express.json())

app.put('/pull', (req, res) => {
  if (secret_key != 0 &&
	  req.body && req.body.key &&
	  secret_key == (req.body.key+"\n")) {

	shell.exec('git pull origin $(git rev-parse --abbrev-ref HEAD)')

	console.log('pulled.')
    res.send('pulled. bye.')
  } else {
    console.log('not pulled.')
    res.send('not pulled.')
  }
})

app.put('/restart', (req, res) => {
  if (secret_key != 0 &&
	  req.body && req.body.key &&
	  secret_key == (req.body.key+"\n")) {

	shell.exec('docker restart april-app')

	console.log('restarted.')
    res.send('restarted. bye.')
  } else {
    console.log('not restarted.')
    res.send('not restarted.')
  }
})

app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`)
})

