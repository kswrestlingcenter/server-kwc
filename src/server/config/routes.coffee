Controllers = require "../controllers"

module.exports = (app) ->
  app.post '/api/login', (req, res) ->
    console.log "ROUTES - Login"
    Controllers.User().login req, res
