# All templates can access session vars
Template.registerHelper 'session', (input) ->
  Session.get input

Template.registerHelper 'signInRedirect', ->
  # FlowRouter.go 'signIn'
  FlowRouter.reload()
  Materialize.toast "Uh oh, something went wrong..." , 3000, 'red lighten-1 grey-text text-darken-4', ->
    Materialize.toast "Please sign in again, friend!" , 5000, 'lime grey-text text-darken-4'

Template.registerHelper 'displayName', (userOrUserId) ->
  displayName userOrUserId

# Template.registerHelper 'userSlug', (userOrUserId) ->
#   slug = Users.getUser(userOrUserId).profile.nickName
#   if slug
#     return slug.trim()[0...6]
#   else Users.getUser(userOrUserId)[0...6]


Template.bgphoto.rendered = ->
  createBackgroundSVG()
  # TODO switch to materialize parallax http://materializecss.com/parallax.html

Template.home.rendered = ->
  # $('#bg-photo-svg').remove()

# hack
Template.masterNav.rendered = ->
  this.$('#at-nav-button').addClass("waves-effect btn-large lime-text accent-2-text transparent")  
  console.log "masterNav rendered"  
  this.$(".button-collapse").sideNav
    closeOnClick: false
  console.log "sideNav init (should be -after- masterNav"

Template.landingFooter.rendered = ->
  this.$('#at-nav-button').addClass("waves-effect btn-large lime-text accent-2-text transparent")

