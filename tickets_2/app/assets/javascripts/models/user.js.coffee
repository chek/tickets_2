class Tickets2.Models.User extends Tickets2.Models.Base

  @adminRole: 'admin'
  @supportRole: 'support'
  @customerRole: 'customer'

  @currentUser: null

  @setCurrentUser: (id, role) ->
    Tickets2.Models.User.currentUser = new Tickets2.Models.User()
    if id?
      Tickets2.Models.User.currentUser.set('id', id)
      Tickets2.Models.User.currentUser.set('role', role)

  urlRoot: '/users'

  logoutSuccess: ->
    Tickets2.Models.User.setCurrentUser(null, null)
    Tickets2.Models.Base.successHandler()

  logout: (successHandler, errorHandler) ->
    Tickets2.Vars.successHandler = successHandler
    Tickets2.Vars.errorHandler = errorHandler
    this.restMethod('sign_out_ajax', 'POST', this.logoutSuccess, this.logoutSuccess);
    return

  loginSuccess: (data) ->
    Tickets2.Models.User.setCurrentUser(data.user_id, data.role)
    Tickets2.Models.Base.successHandler()

  login: (email, password, successHandler, errorHandler) ->
    Tickets2.Vars.successHandler = successHandler
    Tickets2.Vars.errorHandler = errorHandler
    this.restMethod('sign_in_ajax?email='+email+'&password='+password, 'POST', this.loginSuccess, Tickets2.Models.Base.errorHandler);
    return

  signup: (email, password, successHandler, errorHandler) ->
    Tickets2.Vars.successHandler = successHandler
    Tickets2.Vars.errorHandler = errorHandler
    this.restMethod('sign_up_ajax?email='+email+'&password='+password, 'POST', this.loginSuccess, Tickets2.Models.Base.errorHandler);
    return

  updateRole: ->
    this.restMethod('update_role?id='+this.get('id')+'&role='+this.get('role'), 'POST', null, null);
    return


  getCurrentUserSuccess: (data) ->
    Tickets2.Models.User.setCurrentUser(data.user_id, data.role)

  getCurrentUser: ->
    this.restMethod('get_current_user', 'GET', this.getCurrentUserSuccess, this.getCurrentUserSuccess);
    return