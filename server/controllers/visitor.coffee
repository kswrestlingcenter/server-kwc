Visitor = require '../models/visitor'

class VisitorController
  addToMarketing: (req, res) ->
    duplicateVisitor = await Visitor.findOne({email: req.body.email})

    if duplicateVisitor
      if duplicateVisitor.mailingList
        return res.json({result: "Already subscribed"})
      Visitor.updateOne {email: req.body.email}, {$set: {mailingList: true}}, (err, response) ->
        if err then return res.json({error: err})
        return res.json({result: "success!"})
    else
      newVisitor = new Visitor req.body
      newVisitor.mailingList = true
      newVisitor.save()
      return res.json({result: "success!", data: newVisitor})

module.exports = ->
  new VisitorController()