{createServer} = require 'http'
express        = require 'express'
path           = require 'path'

app = express()

app.set('port', process.env.PORT or 5050)

app.use express.json()
app.use express.urlencoded({extended: true})

################################################################
# Startup
################################################################

server = createServer(app)

console.log "APP - Starting Server on port", app.get('port')
server.listen app.get('port')

console.log "APP - Server started on port %d in %s mode", app.get('port'), app.settings.env

process.on 'uncaughtException', (err) ->
  console.log "APP - caught an uncaught"
  console.error err