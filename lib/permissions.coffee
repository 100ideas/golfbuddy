# See telescope for more goodies
# https://github.com/TelescopeJS/Telescope/blob/master/packages/telescope-users/lib/permissions.js

Users.can = {}

Users.can.edit = (user, document) ->
  user ?= Meteor.user()
  return false if (!user || !document)
  Users.is.admin(user) or Users.is.owner(user, document)

Users.can.submitField = (user, field) ->
  return false if (!field.editableBy || !user)
  # is the field editable by admins?
  adminCheck = _.contains(field.editableBy, "admin") and Users.is.admin(user)  
  # is the field editable by regular users?
  memberCheck = _.contains(field.editableBy, "member"); 
  adminCheck or memberCheck;

# Check if a user can edit a field – for now, identical to Users.can.submitField
Users.can.editField = Users.can.submitField