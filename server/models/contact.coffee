mongoose       = require 'mongoose'

contactSchema = new mongoose.Schema
  email    : String
  firstName     : String
  lastName     : String
  subject     : String
  message     : String
  created  : type: Date, default: Date.now
  comment  : Array

contactSchema.set 'toJSON', {getters : true} # output the virtual getters when calling toJSON

# Virtuals ---------------------------------------------------------------------

contactSchema.virtual('fullName').get ->
  name = "#{@firstName or ''} #{@lastName or ''}".trim()
  unless name.length then name = @email
  name

# Methods ----------------------------------------------------------------------

#sets this instance password and calls back with the resulting hashed password; does not save!
contactSchema.methods.addComment = (comment, cb) ->
  console.log "About to add comment: ", comment


module.exports = mongoose.model 'contacts', contactSchema
module.exports.Schema = contactSchema