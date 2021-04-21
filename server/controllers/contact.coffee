contact = require '../models/contact'

class contactController
  addNewContact: (req, res) ->
    newcontact = new contact req.body
    console.log("new contact created: ", newcontact, "\n\n", "end","\n\n")
    newcontact.save()
    return res.json({result: "success", data2: newcontact})

  # getMarketingSubscribers: (req, res) ->
  #   subscribers = await Visitor.find()
  #   return res.json({subscribers})

  getContactResponses: (req, res) ->
    contactResponses = await contact.find()
    return res.json({contactResponses})

module.exports = ->
  new contactController()