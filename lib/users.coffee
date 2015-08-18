# collection2 user schema boilerplate
# https://github.com/aldeed/meteor-collection2#attach-a-schema-to-meteorusers
Schema.UserProfile = new SimpleSchema 

  name:
    type: String,
    # regEx: /^[a-z ,.'-]{2,16}$/,
    max: 40

  birthday:
    type: Date,
    optional: true
    autoform:
      type: "pickadate"
  
  gender:
    type: String,
    allowedValues: ['Male', 'Female'],

  handicap:
    type: String,
    optional: true
    autoform:
      afFieldInput:
        type: "number"
  
  scores:
    type: [Number]
    optional: true

  bio:
    type: String,
    optional: true

# Telescope Users.schema
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-users/lib/users.js
Schema.User = new SimpleSchema
  _id:
    type: String
    optional: true
  
  #  Whenever the "content" field is updated, automatically set
  # the first word of the content into firstWord field.
  username:
    type: String,
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    public: true
    # optional: true
    # autoValue: ->
    #   content = this.field "content" # <- TODO pick proper field... label?
    #   return content.value.split(' ')[0] if content.isSet
      #else
        #this.unset(); # Prevent user from supplying her own value    
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
  
  profile:
    type: Schema.UserProfile
    editableBy: ["admin", "member"]
    optional: true

  # TODO add edit autoform for profile page only for existing admins
  isAdmin:
    type: Boolean
    optional: true
    editableBy: ["admin"]
    autoform:
      type: "switch"    
  
Users.attachSchema Schema.User

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
  return user.username;


#############################################
#
# Accounts.user schema
#
# { "_id" : "2oTr3mNzFB69Rwnqq", "createdAt" : ISODate("2015-08-14T20:29:16.939Z"), "services" : { "password" : { "bcrypt" : "$2a$gZmYQ.H6" }, "resume" : { "loginTokens" : [ { "when" : ISODate("2015-08-14T20:29:17.046Z"), "hashedToken" : "a23asd=" } ] } }, "emails" : [ { "address" : "en@en.ex", "verified" : false } ] }
