Meteor.startup ->
  FlowRouter.reload()
  BlazeLayout.setRoot 'body'

# All templates can access session vars
Template.registerHelper 'session', (input) ->
  Session.get input

Template.bgphoto.rendered = ->
  createBackgroundSVG()
  # TODO switch to materialize parallax http://materializecss.com/parallax.html

Template.landingFooter.rendered = ->
  this.$('#at-nav-button').addClass("waves-effect btn-large lime-text accent-2-text transparent")

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


#############################################################################
# Animations

# counter starts at 0
Session.setDefault 'counter', 0
Session.setDefault 'showBillCard', 'off'

Template.hello.helpers
  counter: ->
    Session.get('counter')

Template.hello.events
  'click .btn': ->
    # increment the counter when button is clicked
    Session.set 'counter', Session.get('counter') + 1
    Session.set 'showBillCard', if Session.get 'showBillCard' then '' else 'off'
    console.log Session.get 'showBillCard'
    $ '#bill-button span.card-bullet'
      .addClass "animated"
      .one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', (e) ->
        $('#bill-button span.card-bullet').removeClass('animated')
