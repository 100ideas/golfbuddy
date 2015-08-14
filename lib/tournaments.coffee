# Tournament
# the title is a string
# the owner is a user
# the course is a course
# the type is a string

@Tournaments = new Mongo.Collection 'tournaments'

# Using Template-Level Subscriptions with Blaze
# https://kadira.io/academy/meteor-routing-guide/content/subscriptions-and-data-management/with-blaze
Meteor.subscribe 'tournaments' if Meteor.isClient

