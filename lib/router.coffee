FlowRouter.route '/',
  name: "home",
  action: (params, queryParams) ->
    if Meteor.user()
      BlazeLayout.render 'masterLayout', 
        top: "nav",
        main: "home",
        bottom: "footer",      
    else
      BlazeLayout.render 'masterLayout', 
        nav: {},
        main: "landing",
        bottom: "landingFooter",


FlowRouter.route '/private',
  name: "private",
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: (params, queryParams) ->
    BlazeLayout.render 'masterLayout',
      top: "nav",
      main: "private",
      bottom: "footer",
      

FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'masterLayout',
      top: "nav",
      main: "pageNotFound",
      bottom: "footer",