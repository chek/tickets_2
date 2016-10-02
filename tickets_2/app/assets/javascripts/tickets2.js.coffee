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
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()
    if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.customerRole
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()


$(document).ready ->
  Tickets2.initialize()

