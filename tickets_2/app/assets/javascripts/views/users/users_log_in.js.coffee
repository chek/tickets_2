class Tickets2.Views.UsersLogin extends Tickets2.Views.Base

  logoutTemplate: _.template("<button type='button' class='btn logout btn-primary'>Sign out</button>")

  loginTemplate: _.template("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='.sign-in-modal'>Sign in</button>
                            <%
                            // login dlg
                            %>
                            <div id='login-container' class='modal fade modal-form sign-in-modal' tabindex='-1' role='dialog' aria-labelledby='sign-in-modal-label' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='sign-in-modal-label'>Sign in</h4>
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
                                        <span class='help-inline'>Something wrong</span>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>")

  signUpTemplate: _.template("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='.sign-up'>Sign up</button>
                            <%
                            // sign-up dlg
                            %>
                            <div id='sign-up-container' class='modal fade modal-form sign-up' tabindex='-1' role='dialog' aria-labelledby='sign-up-modal-label' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='sign-up-modal-label'>Sign up</h4>
                                  </div>
                                  <div class='modal-body'>
                                    <form id='sign-up-form' data-toggle='validator' role='form'>
                                      <div class='form-group email'>
                                        <label for='inputEmail' class='control-label'>Email</label>
                                        <input type='email' class='form-control' id='signUpInputEmail' placeholder='Email' data-error='Bruh, that email address is invalid' required>
                                        <div class='help-block'>Email not valid</div>
                                      </div>



                                      <div class='form-group password'>
                                        <label for='inputPassword' class='control-label'>Password</label>
                                        <input type='password' data-min-length='6' class='form-control' id='signUpInputPassword' placeholder='Password' required>
                                        <div class='help-block'>Minimum of 6 characters</div>
                                      </div>

                                      <div class='form-group password-confirm'>
                                        <label for='inputPassword' class='control-label'>Confirmation</label>
                                        <input type='password' data-min-length='6' class='form-control' id='signUpInputPasswordConfirm' placeholder='Confirm' required>
                                        <div class='help-block'>Confirmation error</div>
                                      </div>



                                      <div class='form-group'>
                                        <button class='btn sign-up btn-primary' >Submit</button>
                                      </div>
                                      <div class='control-group error'>
                                        <span class='help-inline'>User already exist</span>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>")

  events: {
    'click button.login': 'login',
    'click button.logout': 'logout',
    'click button.sign-up': 'signup'
  }

  error: (status) ->
    $('#login-container .help-inline').show()
    return

  signup: (e) ->
    e.preventDefault()
    valid = true
    $('#sign-up-container .help-block').hide()
    emailAddress = $('#signUpInputEmail').val()
    pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    emailValid = pattern.test(emailAddress);
    if !emailValid && valid
      valid = false
      $('#sign-up-container .email .help-block').show()

    if $('#signUpInputPassword').val().length < 6  && valid
      valid = false
      $('#sign-up-container .password .help-block').show()

    if $('#signUpInputPasswordConfirm').val() != $('#signUpInputPassword').val()  && valid
      valid = false
      $('#sign-up-container .password-confirm .help-block').show()

    if valid
      Tickets2.Models.User.currentUser.signup(emailAddress, $('#signUpInputPassword').val(), this.success, this.error)

    return

  success: ->
    Tickets2.Views.Base.closeModal()
    Tickets2.initViews()


  login: (e) ->
    e.preventDefault()
    Tickets2.Models.User.currentUser.login($('#inputEmail').val(), $('#inputPassword').val(), this.success, this.error)
    return

  logout: ->
    Tickets2.Models.User.currentUser.logout(Tickets2.initViews, null)
    return

  render: ->
    if Tickets2.Models.User.currentUser.get('id')?
      this.$el.html(this.logoutTemplate())
    else
      this.$el.html(this.loginTemplate())
      this.$el.append(this.signUpTemplate())
    $('#header').html(this.$el)
    return this
