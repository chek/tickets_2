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

$(document).ready ->
  Tickets2.initialize()

