class Tickets2.Models.User extends Backbone.Model

  urlRoot: '/users'

  logout: (successHandler) ->
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


  login: (email, password, successHandler) ->
    #this.restMethod('sign_out_ajax', 'POST', {}, nil, null)
    $.ajax 'users/sign_in_ajax?email='+email+'&password='+password,
      type: 'POST'
      async: false,
      cache: false,
      contentType: false,
      processData: false,
      error: (jqXHR, textStatus, errorThrown) ->
      success: (data, textStatus, jqXHR) ->
        Tickets2.Vars.currentUser = new Tickets2.Models.User()
        Tickets2.Vars.currentUser.set('id',data.user_id)
        view = new Tickets2.Views.UsersLogin({})
        view.render()
    return
