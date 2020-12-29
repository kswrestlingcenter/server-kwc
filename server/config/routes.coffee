Controllers = require "../controllers"
jwt         = require('jsonwebtoken')

verifyToken = (req, res, next) ->
  bearerHeader = req.headers['authorization']
  unless typeof bearerHeader is 'undefined'
    bearer = bearerHeader.split(' ')
    bearerToken = bearer[1]
    req.token = bearerToken
    next()
  else
    res.sendStatus(401)

module.exports = (app) ->
  app.post '/api/login', (req, res) ->
    console.log "ROUTES - Login"
    Controllers.User().login req, res

  app.get '/api/events', verifyToken, (req, res) ->
    console.log "ROUTES - GET Events", req.headers
    jwt.verify req.token, 'the_secret_key', (err) ->
      return res.sendStatus(401) if err
      Controllers.Events().getEvents req, res

  app.post '/api/events/newEvent', verifyToken, (req, res) ->
    console.log "ROUTES - GET Events", req.headers
    jwt.verify req.token, 'the_secret_key', (err) ->
      return res.sendStatus(401) if err
      Controllers.Events().addEvent req, res

  app.post '/api/mailingList', (req, res) ->
    console.log "MAILING LIST", req.body
    Controllers.Visitor().addToMarketing req, res
