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

app.put('/', (req, res) => {
  if (secret_key != 0 &&
	  req.body && req.body.key &&
	  secret_key == (req.body.key+"\n")) {

	shell.exec('git pull origin $(git rev-parse --abbrev-ref HEAD)')
	
    res.send('Pulled. bye.')
  } else {
    res.send('bye.')
  }
})

app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`)
})

