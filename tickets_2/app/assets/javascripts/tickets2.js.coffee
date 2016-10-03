window.Tickets2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Vars: {}
  initialize: ->
    Tickets2.Models.User.setCurrentUser(null, null)
    Tickets2.Models.User.currentUser.getCurrentUser()
    Tickets2.initViews()
  initViews: ->
    $('#content').html('')
    view = new Tickets2.Views.UsersLogin({})
    view.render()
    if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.adminRole
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()
    if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.supportRole
      Tickets2.Views.TicketsIndex.render()
      reportNavigationView = new Tickets2.Views.ReportNavigation({})
      reportNavigationView.render()
    if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.customerRole
      createTicketView = new Tickets2.Views.CreateTicket({})
      createTicketView.render()
      Tickets2.Views.TicketsIndex.render()


$(document).ready ->
  #this var need for testing
  Tickets2.Vars.testEnv = false
  if window.location.href == 'http://localhost:3000/specs'
    Tickets2.Vars.testEnv = true
  if !Tickets2.Vars.testEnv
    Tickets2.initialize()

