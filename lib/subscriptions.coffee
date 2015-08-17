if Meteor.isClient 
  Meteor.subscribe 'tournaments'

@Tournaments = new Mongo.Collection 'tournaments'

# Tournament
# the title is a string
# the owner is a user
# the course is a course
# the type is a string
