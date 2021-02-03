ScheduledEvent = require '../models/scheduledEvent'

class EventController
  getEvents: (req, res) ->
    events = await ScheduledEvent.find()
    console.log {events}
    res.json(events)

  getNewEvent: (req, res) ->
    event = new ScheduledEvent({
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
    console.log "CONTROLLER - Event.updateEvent request: ", req.event
    return res.status(400).json({error: "Event Data missing"}) unless req.body

    event = new ScheduledEvent(req.body)
    console.log "\n\n\n", {event}, "\n\n\n"
    event.save (error) ->
      return res.status(500).json({error}) if error
      return res.json(event)

module.exports = ->
  new EventController()