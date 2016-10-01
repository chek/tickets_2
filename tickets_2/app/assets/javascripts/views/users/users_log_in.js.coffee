class Tickets2.Views.UsersLogin extends Backbone.View

  logoutTemplate: _.template("<button type='button' class='btn logout btn-primary'>Log out</button>")


  loginTemplate: _.template("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='.bd-example-modal-sm'>Log in</button>
                            <div id='login-container' class='modal fade bd-example-modal-sm' tabindex='-1' role='dialog' aria-labelledby='mySmallModalLabel' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='mySmallModalLabel'>Log in</h4>
                                  </div>
                                  <div class='modal-body'>
                                    <form data-toggle='validator' role='form'>
                                      <div class='form-group'>
                                        <label for='inputEmail' class='control-label'>Email</label>
                                        <input type='email' class='form-control' id='inputEmail' placeholder='Email' data-error='Bruh, that email address is invalid' required>
                                        <div class='help-block with-errors'></div>
                                      </div>
                                      <div class='form-group'>
                                        <label for='inputPassword' class='control-label'>Password</label>
                                        <input type='password' class='form-control' id='inputPassword' placeholder='Password' required>
                                      </div>
                                      <div class='form-group'>
                                        <button class='btn login btn-primary' >Submit</button>
                                      </div>
                                      <div class='control-group error'>
                                        <span class='help-inline'>Somrthing wrong</span>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>")

  events: {
    'click button.login': 'login',
    'click button.logout': 'logout'
  }

  success: ->
    $('#login-container').modal('hide')
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
    return

  error: (status) ->
    $('#login-container .help-inline').show()
    return

  login: (e) ->
    e.preventDefault()
    Tickets2.Vars.currentUser.login($('#inputEmail').val(), $('#inputPassword').val(), this.success, this.error)
    return

  logout: ->
    Tickets2.Vars.currentUser.logout()
    return

  render: ->
    if Tickets2.Vars.currentUser.get('id')?
      this.$el.html(this.logoutTemplate())
    else
      this.$el.html(this.loginTemplate())
    $('#log_in_out').html(this.$el)
    return this
