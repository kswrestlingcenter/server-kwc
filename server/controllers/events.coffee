scheduledEvent = require '../models/scheduledEvent'

class eventController
  getEvents: (req, res) ->
    events = await scheduledEvent.find()
    console.log {events}
    res.json(events)

  getNewEvent: (req, res) ->
    event = new scheduledEvent({
      location: {
        address: "1671 E Kansas City Rd"
        city: "Olathe"
        state: "KS"
        postalCode: "66061"
      }
    })
    console.log "Getting New Event - EventController", event
    return res.json(event)

  updateEvent: (req, res) ->
    event = new scheduledEvent(req.body)
    console.log "CONTROLLER - Event.updateEvent request: ", req.body
    # return res.status(400).json({error: "Event Data missing"}) unless req.body
    console.log "\n\n\n", {event}, "\n\n\n"
    event.save()
    return res.json({result: "success",data: event})
    # event.save (error) ->
    #   return res.status(500).json({error}) if error
    #   return res.json(event)

module.exports = ->
  new eventController()