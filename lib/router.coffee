FlowRouter.route '/',
  name: "home",
  action: (params, queryParams) ->
    if not Meteor.user()
      BlazeLayout.render 'landingLayout', main: "landing"
    else
      BlazeLayout.render 'masterLayout', 
        nav: "nav",
        main: "home"
        footer: "footer",

FlowRouter.route '/private',
  name: "private",
  triggersEnter: [AccountsTemplates.ensureSignedIn],
  action: (params, queryParams) ->
    BlazeLayout.render 'masterLayout',
      footer: "footer",
      main: "private",
      nav: "nav",

FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'masterLayout',
      footer: "footer",
      main: "pageNotFound",
      nav: "nav",
