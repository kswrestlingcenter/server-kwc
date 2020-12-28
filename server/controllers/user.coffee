jwt  = require 'jsonwebtoken'
User = require '../models/user'

class UserController

  login: (req, res) ->
    {email, password} = req.body
    return res.status(401).json({error: "User Info Missing"}) unless email and password

    user = await User.findOne({email})
    return res.status(401).json({error: "No User Found"}) unless user

    user.checkPassword password, (err, passwordMatches) ->
      return res.status(401).json({error: err}) if err
      return res.status(401).json({error: "Passwords do not match"}) unless passwordMatches

      token = jwt.sign({user}, 'the_secret_key')

      return res.json({
        token,
        email: user.email,
        name: user.name
      })

module.exports = ->
  new UserController()