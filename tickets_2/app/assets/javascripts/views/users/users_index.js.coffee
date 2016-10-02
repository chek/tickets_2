class Tickets2.Views.UsersIndex extends Backbone.View

  template: _.template("<h1>Users</h1>" +
                       "<ul></ul>")

  tagName:  'div'

  render: ->
    this.$el.html(this.template())
    $('#content').html(this.$el)
    return this
