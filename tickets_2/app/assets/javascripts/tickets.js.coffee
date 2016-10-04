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
      ticketstNavigationView = new Tickets2.Views.TicketsNavigation({})
      ticketstNavigationView.render()
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()
    else if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.supportRole
      reportNavigationView = new Tickets2.Views.ReportNavigation({})
      reportNavigationView.render()
      Tickets2.Views.TicketsIndex.render()
    else if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.customerRole
      createTicketView = new Tickets2.Views.CreateTicket({})
      createTicketView.render()
      Tickets2.Views.TicketsIndex.render()
    else
      $('#content').html('<h1>Welcome to simple tickets</h1>')


$(document).ready ->
  #this var need for testing
  Tickets2.Vars.testEnv = false
  if window.location.href.indexOf('http://localhost:3000/specs') >= 0
    Tickets2.Vars.testEnv = true
  if !Tickets2.Vars.testEnv
    Tickets2.initialize()

