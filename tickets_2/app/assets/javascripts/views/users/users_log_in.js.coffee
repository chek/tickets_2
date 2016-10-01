class Tickets2.Views.UsersLogin extends Backbone.View

  loginTemplate: _.template("<a class='login'>Log in</a>")

  logoutTemplate: _.template("<a class='logout'>Log out</a>")

  events: {
    'click a.login': 'login',
    'click a.logout': 'logout'
  }

  login: ->
    self = this
    Tickets2.Vars.currentUser.login('chekst@gmail.com', 'qwer1234', self.render)
    return

  logout: ->
    self = this
    Tickets2.Vars.currentUser.logout(self.render)
    return

  render: ->
    if Tickets2.Vars.currentUser.get('id')?
      this.$el.html(this.logoutTemplate())
    else
      this.$el.html(this.loginTemplate())
    $('#log_in_out').html(this.$el)
    return this
