window.Tickets2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Vars: {}
  initialize: ->
    Tickets2.Vars.currentUser = new Tickets2.Models.User()
    setCurrentUserId()
    view = new Tickets2.Views.UsersLogin({})
    view.render()
    if Tickets2.Vars.currentUser.get('role') == 'admin'
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()

$(document).ready ->
  Tickets2.initialize()

