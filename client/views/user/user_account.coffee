Template.userAccount.helpers
  user: -> @
  userFields: ->
    Meteor.users.simpleSchema().getEditableFields(Meteor.user())
  logContext: ->
    console.log "Template.userAccount context (this): "
    console.dir this
    console.log "Users.getUser(): "
    console.dir Users.getUser()

Template.userAccount.rendered = ->

