Template.userAccount.helpers
  user: -> @
  userFields: ->
    Meteor.users.simpleSchema().getEditableFields(Meteor.user())