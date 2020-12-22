ScheduledEvent = require '../models/scheduledEvent'

class EventController
  getEvents: (req, res) ->
    events = await ScheduledEvent.find()
    console.log {events}
    res.json(events)


module.exports = ->
  new EventController()