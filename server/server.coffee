{createServer} = require 'http'
express        = require 'express'
path           = require 'path'
cors           = require 'cors'
helmet         = require 'helmet'
morgan         = require 'morgan'

connectDatabase = require('./config/database').connect
setupRoutes     = require './config/routes'

app = express()

app.set('port', process.env.PORT or 5051)

app.use helmet()
app.use cors()
app.use morgan(':method :url :status :response-time ms - :res[content-length]')

app.use express.json()
app.use express.urlencoded({extended: true})

app.use(express.static(path.resolve(__dirname, '../dist/')))

console.log "APP - Setting up Routes"
setupRoutes(app)

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
  process.exit(1)

process.on 'SIGTERM', (err) ->
  console.log "APP - apply SIGTERM"
  console.log err
  process.exit(1)