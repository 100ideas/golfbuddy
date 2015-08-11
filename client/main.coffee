Meteor.startup ->
  FlowRouter.reload()

# counter starts at 0
Session.setDefault 'counter', 0

Template.hello.helpers
  counter: ->
    Session.get('counter')

Template.hello.events
  'click .btn': ->
    # increment the counter when button is clicked
    Session.set 'counter', Session.get('counter') + 1

# If for some reason we detect that the user was logged out
# https://github.com/meteor-useraccounts/core/issues/308#issuecomment-127581562
# Tracker.autorun ->
#   BlazeLayout.render 'masterLayout', main: "landing" unless Meteor.user()

# https://github.com/kadirahq/flow-router/#flowroutergetroutename
Tracker.autorun ->
  routeName = FlowRouter.getRouteName()
  # routeState = FlowRouter.current()
  console.log "routerState:"
  # console.table(routeState, ["path", "title", "state", "querystring", "pathname", "params", "options", "name"])
