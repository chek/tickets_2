class Tickets2.Models.User extends Tickets2.Models.Base

  urlRoot: '/users'

  externalSuccessHandler: ->

  logoutSuccess: ->
    Tickets2.setCurrentUser(null, null)
    Tickets2.initViews()

  logout: ->
    this.restMethod('sign_out_ajax', 'POST', this.logoutSuccess, null);
    return

  loginSuccess: (data) ->
    Tickets2.setCurrentUser(data.user_id, data.role)
    if Tickets2.Vars.successHandler?
      Tickets2.Vars.successHandler()
      Tickets2.Vars.successHandler = null
    Tickets2.initViews()

  login: (email, password, successHandler, errorHandler) ->
    Tickets2.Vars.successHandler = successHandler
    this.restMethod('sign_in_ajax?email='+email+'&password='+password, 'POST', this.loginSuccess, errorHandler);
    return

  signup: (email, password, successHandler, errorHandler) ->
    Tickets2.Vars.successHandler = successHandler
    this.restMethod('sign_up_ajax?email='+email+'&password='+password, 'POST', this.loginSuccess, errorHandler);
    return

  updateRole: ->
    this.restMethod('update_role?id='+this.get('id')+'&role='+this.get('role'), 'POST', null, null);
    return
