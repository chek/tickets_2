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
        Tickets2.setCurrentUser(null, null)
        Tickets2.initViews()
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
        Tickets2.setCurrentUser(data.user_id, data.role)
        successHandler()
        Tickets2.initViews()
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
        Tickets2.setCurrentUser(data.user_id, data.role)
        successHandler()
        Tickets2.initViews()
    return
