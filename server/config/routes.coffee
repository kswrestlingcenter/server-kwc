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

  app.get '/api/newEvent', verifyToken, (req, res) ->
    console.log "ROUTES - GET new Event", req.headers
    jwt.verify req.token, 'the_secret_key', (err) ->
      return res.sendStatus(401) if err
      Controllers.Events().getNewEvent req, res

  app.post '/api/updateEvent', verifyToken, (req, res) ->
    console.log "ROUTES - Post updateEvent", req
    jwt.verify req.token, 'the_secret_key', (err) ->
      return res.sendStatus(401) if err
      Controllers.Events().updateEvent req, res

  app.post '/api/mailingList', (req, res) ->
    console.log "New MAILING LIST", req.body
    Controllers.Visitor().addToMarketing req, res

  app.get '/api/mailingList', verifyToken, (req, res) ->
    console.log "GET MAILING LIST", req.headers
    jwt.verify req.token, 'the_secret_key', (err) ->
      return res.sendStatus(401) if err
      Controllers.Visitor().getMarketingSubscribers req, res
  
  app.post '/api/contactForm', (req, res) ->
    console.log "CONTACT FORM", req.body
    Controllers.contact().addNewContact req, res

  app.get '/api/contactForm', verifyToken, (req, res) ->
      console.log "GET Contacts", req.headers
      jwt.verify req.token, 'the_secret_key', (err) ->
        return res.sendStatus(401) if err
        Controllers.contact().getContactResponses req, res

