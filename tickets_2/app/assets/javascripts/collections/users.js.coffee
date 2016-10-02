class Tickets2.Collections.Users extends Backbone.Collection

  model: Tickets2.Models.User

  url: '/users/list'

  parse: (response) ->
    return response.users
