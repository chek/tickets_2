window.Tickets2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Vars: {}
  initialize: ->
    initCurrentUser()
    Tickets2.initViews()
  setCurrentUser: (id, role) ->
    Tickets2.Vars.currentUser = new Tickets2.Models.User()
    if id?
      Tickets2.Vars.currentUser.set('id', id)
      Tickets2.Vars.currentUser.set('role', role)
  initViews: ->
    view = new Tickets2.Views.UsersLogin({})
    view.render()
    if Tickets2.Vars.currentUser.get('role') == 'admin'
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()


$(document).ready ->
  Tickets2.initialize()

