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

// pull latest code
app.put('/pull', (req, res) => {
  if (secret_key != 0 &&
	  req.body && req.body.key &&
	  secret_key == (req.body.key+"\n")) {

	shell.exec('git pull origin $(git rev-parse --abbrev-ref HEAD)')

	console.log('pulled.')
    res.send('pulled.')
  } else {
    console.log('not pulled.')
    res.send('not pulled.')
  }
})

// restart containers
app.put('/pull', (req, res) => {
  if (secret_key != 0 &&
	  req.body && req.body.key &&
	  secret_key == (req.body.key+"\n")) {

	console.log('will be restarted.')
    res.send('will be restarted.')

	shell.exec('docker restart april-app')
	shell.exec('docker restart april-puller')

  } else {
    console.log('not pulled.')
    res.send('not pulled.')
  }
})


// run puller process
app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`)
})

