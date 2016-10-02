window.Tickets2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Vars: {}
  initialize: ->
    Tickets2.initializeCurrentUser()
    Tickets2.initViews()
  initializeCurrentUser: (id, role) ->
    #console.log Tickets2.Models.User
    Tickets2.Vars.currentUser = new Tickets2.Models.User()
    Tickets2.Vars.currentUser.getCurrentUser()
  setCurrentUser: (id, role) ->
    Tickets2.Vars.currentUser = new Tickets2.Models.User()
    if id?
      Tickets2.Vars.currentUser.set('id', id)
      Tickets2.Vars.currentUser.set('role', role)
  initViews: ->
    $('#content').html('')
    view = new Tickets2.Views.UsersLogin({})
    view.render()
    if Tickets2.Vars.currentUser.get('role') == 'admin'
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()


$(document).ready ->
  Tickets2.initialize()

