ScheduledEvent = require '../models/scheduledEvent'

class EventController
  getEvents: (req, res) ->
    events = await ScheduledEvent.find()
    console.log {events}
    res.json(events)

  addEvent: (req, res) ->
    console.log "CONTROLLER - Event.addEvent request: ", req.body
    return res.status(400).json({error: "Event Data missing"}) unless req.body

    event = new ScheduledEvent(req.body)
    console.log "\n\n\n", {event}, "\n\n\n"
    event.save (error) ->
      return res.status(500).json({error}) if error
      return res.json(event)

module.exports = ->
  new EventController()