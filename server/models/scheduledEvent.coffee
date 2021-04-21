mongoose       = require 'mongoose'

scheduledEvent = new mongoose.Schema
  status    : type: String, default: 'created' #, enums: ['created', 'saved', 'published', 'deleted']
  created   : type: Date, default: Date.now
  eventName : type: String, required: true
  description: type: String
  contact: type: String
  email: type: String
  eventDate :
    startDate : type: Date
    startTime : type: String
    endDate   : type: Date
    endTime   : type: String
  location : # Send me location
     address  : String
     address2 : String
     city     : String
     state    : String
     postalCode: String
     country  : type: String, default: "US"
     lat      : Number
     lng      : Number
     timezone : String
  entryFee: String
  pictureUrl: String # Link to where we will store this on AWS
  eventFlyerPDF: String # Link to where we will store this on AWS

scheduledEvent.set 'toJSON', {getters : true} # output the virtual getters when calling toJSON

# Virtuals ---------------------------------------------------------------------

scheduledEvent.virtual('formattedEventName').get ->
  return "The #{@eventName} Invitational"

# Methods ----------------------------------------------------------------------
scheduledEvent.methods.publish = () ->
  @status = 'published'

scheduledEvent.methods.unPublish = () ->
  @status = 'saved'

# TODO: Create indexes

module.exports = mongoose.model 'scheduledEvents', scheduledEvent
module.exports.Schema = scheduledEvent