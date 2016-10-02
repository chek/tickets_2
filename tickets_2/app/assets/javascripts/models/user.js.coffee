class Tickets2.Models.User extends Backbone.Model

  urlRoot: '/users'

  logout: ->
    #this.restMethod('sign_out_ajax', 'POST', {}, nil, null)

    $.ajax 'users/sign_out_ajax',
      type: 'POST'
      async: false,
      cache: false,
      contentType: false,
      processData: false,
      error: (jqXHR, textStatus, errorThrown) ->
      success: (data, textStatus, jqXHR) ->
        Tickets2.Vars.currentUser = new Tickets2.Models.User()
        view = new Tickets2.Views.UsersLogin({})
        view.render()
    return


  login: (email, password, successHandler, errorHandler) ->
    #this.restMethod('sign_out_ajax', 'POST', {}, nil, null)
    $.ajax 'users/sign_in_ajax?email='+email+'&password='+password,
      type: 'POST'
      async: false,
      cache: false,
      contentType: false,
      processData: false,
      error: (jqXHR, textStatus, errorThrown) ->
        errorHandler()
      success: (data, textStatus, jqXHR) ->
        Tickets2.Vars.currentUser = new Tickets2.Models.User()
        Tickets2.Vars.currentUser.set('id',data.user_id)
        Tickets2.Vars.currentUser.set('role',data.role)
        successHandler()
        loginView = new Tickets2.Views.UsersLogin({})
        loginView.render()
        if Tickets2.Vars.currentUser.get('role') == 'admin'
          usersView = new Tickets2.Views.UsersIndex({})
          usersView.render()
    return

  signup: (email, password, successHandler, errorHandler) ->
    #this.restMethod('sign_out_ajax', 'POST', {}, nil, null)
    $.ajax 'users/sign_up_ajax?email='+email+'&password='+password,
      type: 'POST'
      async: false,
      cache: false,
      contentType: false,
      processData: false,
      error: (jqXHR, textStatus, errorThrown) ->
        errorHandler()
      success: (data, textStatus, jqXHR) ->
        Tickets2.Vars.currentUser = new Tickets2.Models.User()
        Tickets2.Vars.currentUser.set('id',data.user_id)
        Tickets2.Vars.currentUser.set('role',data.role)
        successHandler()
        view = new Tickets2.Views.UsersLogin({})
        view.render()
        if Tickets2.Vars.currentUser.get('role') == 'admin'
          usersView = new Tickets2.Views.UsersIndex({})
          usersView.render()
    return
