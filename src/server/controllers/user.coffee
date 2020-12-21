User = require '../models/user'

class UserController

  login: (req, res) ->
    {email, password} = req.body
    return res.status(401).json({error: "User Info Missing"}).end()unless email and password

    user = await User.findOne({email})
    return res.status(401).json({error: "No User Found"}).end() unless user

    user.checkPassword password, (err, passwordMatches) ->
      return res.status(401).json({error: err}).end() if err
      return res.status(401).json({error: "Passwords do not match"}).end() unless passwordMatches
      return res.json(user).status(200).end()

module.exports = ->
  new UserController()