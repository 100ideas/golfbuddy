Template.atmodal.onRendered ->
  $(".modal-trigger").leanModal()

Template.atmodal.helpers
  type: ->

Template.atmodal.events
  'click #atsignupbtn': ->
    AccountsTemplates.setState("signUp")
   
