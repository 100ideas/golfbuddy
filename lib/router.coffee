FlowRouter.route '/',
  name: "home",
  action: (params, queryParams) ->
    if Meteor.user()
      BlazeLayout.render 'masterLayout', 
        nav: "nav",
        main: "home",
        footer: "footer",      
    else
      BlazeLayout.render 'masterLayout', 
        nav: {},
        main: "landing",
        footer: {},


FlowRouter.route '/private',
  name: "private",
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: (params, queryParams) ->
    BlazeLayout.render 'masterLayout',
      nav: "nav",
      main: "private",
      footer: "footer",
      

FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'masterLayout',
      nav: "nav",
      main: "pageNotFound",
      footer: "footer",