mongoose       = require 'mongoose'

VisitorSchema = new mongoose.Schema
  email    : String
  name     : String
  created  : type: Date, default: Date.now
  mailingList: type: Boolean, default: false
  comment  : Array

VisitorSchema.set 'toJSON', {getters : true} # output the virtual getters when calling toJSON

# Virtuals ---------------------------------------------------------------------

VisitorSchema.virtual('fullName').get ->
  name = "#{@firstName or ''} #{@lastName or ''}".trim()
  unless name.length then name = @email
  name

# Methods ----------------------------------------------------------------------

#sets this instance password and calls back with the resulting hashed password; does not save!
VisitorSchema.methods.addComment = (comment, cb) ->
  console.log "About to add comment: ", comment


module.exports = mongoose.model 'visitors', VisitorSchema
module.exports.Schema = VisitorSchema