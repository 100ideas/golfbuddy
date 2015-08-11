Meteor.publish 'tournaments', ->
  Tournaments.find {}

Tournaments.allow
  insert: -> true
  update: -> true
  remove: -> true