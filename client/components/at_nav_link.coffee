Template.atNavLink.helpers
  text: ->
    key = if Meteor.userId() then AccountsTemplates.texts.navSignOut else AccountsTemplates.texts.navSignIn
    T9n.get key, markIfMissing=false

Template.atNavLink.events
  'click #at-nav-link': (event) ->
    event.preventDefault()
    if Meteor.userId()
      AccountsTemplates.logout()
    else
      AccountsTemplates.linkClick("signIn")
