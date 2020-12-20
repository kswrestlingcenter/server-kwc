{createServer} = require 'http'
express        = require 'express'
path           = require 'path'
cors           = require 'cors'
helmet         = require 'helmet'
morgan         = require 'morgan'

connectDatabase = require('./config/database').connect


app = express()

app.set('port', process.env.PORT or 5050)

app.use helmet()
app.use cors()
app.use morgan(':method :url :status :response-time ms - :res[content-length]')

app.use express.json()
app.use express.urlencoded({extended: true})

app.get '/', (req, res) ->
  res.send("Express Server is working!")


console.log "APP - Connecting to Database"
connectDatabase()

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