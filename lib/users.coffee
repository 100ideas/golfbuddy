#see namespace.coffee

Users.getUser = (userOrUserId) ->
  if userOrUserId? 
    unless Meteor.user()
      throw new Error
    else
      Meteor.user()
  else if typeof userOrUserId is 'string'
    Meteor.users.findOne userOrUserId 
  else userOrUserId

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
  
  createdAt:
    type: Date
    optional: true
  
  isAdmin:
    type: Boolean
    optional: true
    editableBy: ["admin", "owner"]
    autoform:
      omit: true
  
  profile:
    type: Object
    optional: true
    blackbox: true
  
Users.attachSchema Users.schema



