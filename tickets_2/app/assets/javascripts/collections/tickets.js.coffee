class Tickets2.Collections.Tickets extends Backbone.Collection

  model: Tickets2.Models.Ticket

  url: '/tickets/list'

  parse: (response) ->
    return response.tickets
