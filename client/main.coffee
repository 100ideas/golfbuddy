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
