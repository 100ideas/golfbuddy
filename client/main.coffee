Meteor.startup ->
  FlowRouter.reload()

# counter starts at 0
Session.setDefault 'counter', 0

Template.home.helpers
  tcount: ->
    Tournaments.find().count()

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


# Template.layout.helpers
#   navtitle: ->
#     text: "golfbuddy", link: "#"
#   navlinks: ->
#     console.log("main.coffee layout.helpers.navlinks")
#     [
#       options: href: "#"
#       linkText: "link 1"
#     ,
#       options: 
#         href: "#loginmodal"
#         class: "waves-effect waves-light btn modal-trigger"
#       linkText: "login/out"
#     ]

# Template.custom-navbar.onRendered(function() {
#   $(".button-collapse").sideNav({
#     closeOnClick: true
#   });
# });

# if Meteor.isServer
#   Meteor.startup ->
#   # code to run on server at startup
