class Tickets2.Views.UsersIndex extends Tickets2.Views.Base

  template: _.template("<h1>Users</h1>" +
                       "<ul class='users list-unstyled'></ul>")

  tagName:  'div'

  initialize: ->
    Tickets2.Vars.users = new Tickets2.Collections.Users()
    this.listenTo(Tickets2.Vars.users, 'add', this.addOne);
    this.listenTo(Tickets2.Vars.users, 'reset', this.addAll);
    this.listenTo(Tickets2.Vars.users, 'all', this.all);

  render: ->
    this.$el.html(this.template())
    $('#content').html(this.$el)
    this.$list = $('ul', this.$el).first()
    Tickets2.Vars.users.fetch({reset: true})
    return this

  addOne: (user) ->
    view = new Tickets2.Views.UserListItem({ model: user });
    this.$list.append(view.render().el);

  addAll: ->
    if Tickets2.Vars.users?
      Tickets2.Vars.users.each(this.addOne, this);