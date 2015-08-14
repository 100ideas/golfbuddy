Meteor.startup ->
  FlowRouter.reload()
  BlazeLayout.setRoot 'body'
  console.log "Meteor.startup: known routes"
  console.log _.map FlowRouter._routes, (r) ->
    r.name || r.path

# All templates can access session vars
Template.registerHelper 'session', (input) ->
  Session.get input

Template.registerHelper 'signInRedirect', ->
  # FlowRouter.go 'signIn'
  FlowRouter.reload()
  Materialize.toast "Uh oh, something went wrong..." , 4000, 'red lighten-1 grey-text text-darken-4', ->
    Materialize.toast "Please login again, friend!" , 8000, 'lime grey-text text-darken-4'

Template.bgphoto.rendered = ->
  createBackgroundSVG()
  # TODO switch to materialize parallax http://materializecss.com/parallax.html

# hack
Template.landingFooter.rendered = ->
  this.$('#at-nav-button').addClass("waves-effect btn-large lime-text accent-2-text transparent")

Template.masterNav.rendered = ->
  this.$('#at-nav-button').addClass("waves-effect btn-large lime-text accent-2-text transparent")  

# If for some reason we detect that the user was logged out
# https://github.com/meteor-useraccounts/core/issues/308#issuecomment-127581562
# Tracker.autorun ->
#   BlazeLayout.render 'masterLayout', main: "landing" unless Meteor.user()

# # https://github.com/kadirahq/flow-router/#flowroutergetroutename
# Tracker.autorun ->
#   routeName = FlowRouter.getRouteName()
#   # routeState = FlowRouter.current()
#   console.log "routerState:"
#   # console.table(routeState, ["path", "title", "state", "querystring", "pathname", "params", "options", "name"])

Accounts.onLogin ->
  Materialize.toast("Welcome back, #{Meteor.user().emails[0].address}", 4000, 'lime grey-text text-darken-4') # 4000 is the duration of the toast
  