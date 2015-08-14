# extend SimpleSchema with custom options
# https://github.com/aldeed/meteor-simple-schema#extending-the-schema-options
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-lib/lib/base.js
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-lib/lib/collections.js
SimpleSchema.extendOptions
  editableBy: Match.Optional [String]

# Telescope Users.schema
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-users/lib/users.js
Users.schema = new SimpleSchema
  _id:
    type: String
    optional: true
  
  nickname:
    type: String,
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: true
  
  emails:
    type: [Object],
    optional: true
  
  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
    optional: true
  
  "emails.$.verified":
    type: Boolean
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true
  
  createdAt:
    type: Date
    optional: true
  
  isAdmin:
    type: Boolean
    optional: true
    editableBy: ["admin", "member"]
    autoform:
      omit: true
  
  profile:
    type: Object
    editableBy: ["admin", "member"]
    optional: true
    blackbox: true
  
Users.attachSchema Users.schema

Users.allow
  update: _.partial App.allowCheck, Meteor.users
  remove: _.partial App.allowCheck, Meteor.users

###################################
# user helpers
#

Users.getUser = (userOrUserId) ->
  unless userOrUserId? 
    unless Meteor.user()
      throw new Error
    else Meteor.user()
  else if typeof userOrUserId is 'string'
    Meteor.users.findOne userOrUserId 
  else userOrUserId

@displayName = (userOrUserId) ->
  user = Users.getUser userOrUserId
  return user.profile.name if user.profile?.name?
  return user.emails[0].address;


#############################################
#
# Accounts.user schema
#
# { "_id" : "2oTr3mNzFB69Rwnqq", "createdAt" : ISODate("2015-08-14T20:29:16.939Z"), "services" : { "password" : { "bcrypt" : "$2a$gZmYQ.H6" }, "resume" : { "loginTokens" : [ { "when" : ISODate("2015-08-14T20:29:17.046Z"), "hashedToken" : "a23asd=" } ] } }, "emails" : [ { "address" : "en@en.ex", "verified" : false } ] }
