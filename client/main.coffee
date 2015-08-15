Meteor.startup ->
  # hack to get signOut route not considered among previous paths
  AccountsTemplates.knownRoutes.push('/sign-out')
  FlowRouter.reload()
  BlazeLayout.setRoot 'body'
  console.log "Meteor.startup: known routes"
  console.log _.map FlowRouter._routes, (r) ->
    r.name || r.path

Tracker.autorun ->
  console.log "routed to -> #{FlowRouter.getRouteName()}"
#   # routeState = FlowRouter.current()
#   console.log "routerState:"
#   # console.table(routeState, ["path", "title", "state", "querystring", "pathname", "params", "options", "name"])

Accounts.onLogin ->
  Materialize.toast("Welcome back, #{Meteor.user().emails[0].address}", 4000, 'lime grey-text text-darken-4') # 4000 is the duration of the toast
  