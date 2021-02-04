Visitor = require '../models/visitor'

class VisitorController
  addToMarketing: (req, res) ->
    duplicateVisitor = await Visitor.findOne({email: req.body.email})

    if duplicateVisitor
      if duplicateVisitor.mailingList
        return res.json({error: "Already subscribed"})
      Visitor.updateOne {email: req.body.email}, {$set: {mailingList: true}}, (err, response) ->
        if err then return res.json({error: err})
        return res.json({result: "success!"})
    else
      newVisitor = new Visitor req.body
      newVisitor.mailingList = true
      newVisitor.save()
      return res.json({result: "success", data: newVisitor})

  getMarketingSubscribers: (req, res) ->
    subscribers = await Visitor.find()
    return res.json({subscribers})

module.exports = ->
  new VisitorController()