FlowRouter.route '/',
  name: "home",
  action: (params, queryParams) ->
    # BUG this is not reactive; log in, then reload page; Meteor.user() isn't
    # checked again so we always stay on landingLayout
    BlazeLayout.render 'masterLayout', 
      top: "masterNav"
      main: "home"
      bottom: "masterFooter"      

FlowRouter.route '/private',
  name: "private"
  triggersEnter: [AccountsTemplates.ensureSignedIn]
  action: (params, queryParams) ->
    BlazeLayout.render 'masterLayout',
      top: "masterNav"
      main: "private"
      bottom: "masterFooter"
      
FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'masterLayout',
      top: "masterNav"
      main: "pageNotFound"
      bottom: "masterFooter"

FlowRouter.route '/users/:username/edit',
  name: "user-edit"
  action: (params, queryParams) ->
    BlazeLayout.render 'masterLayout',
      top: "masterNav"
      main: "userAccount"
      bottom: "masterFooter"