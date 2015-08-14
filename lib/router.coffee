FlowRouter.route '/',
  name: "home",
  action: (params, queryParams) ->
    if Meteor.user()
      BlazeLayout.render 'masterLayout', 
        top: "masterNav",
        main: "home",
        bottom: "masterFooter",      
    else
      BlazeLayout.render 'landingLayout', 
        top: "landingNav",
        main: "landing",
        bottom: "landingFooter",


FlowRouter.route '/private',
  name: "private",
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: (params, queryParams) ->
    BlazeLayout.render 'masterLayout',
      top: "masterNav",
      main: "private",
      bottom: "masterFooter",
      
FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'masterLayout',
      top: "masterNav",
      main: "pageNotFound",
      bottom: "masterFooter",

FlowRouter.route '/users/:_idOrSlug',
  action: (params, queryParams) ->
    BlazeLayout.render 'masterLayout',
      top: "masterNav",
      main: "userProfile",
      bottom: "masterFooter",