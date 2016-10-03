class Tickets2.Collections.ReportTickets extends Backbone.Collection

  model: Tickets2.Models.Ticket

  url: '/tickets/list?report=true'

  parse: (response) ->
    #fetch customers together with tickets, search 1475435340
    Tickets2.Vars.customers = new Tickets2.Collections.Users(response.customers)
    Tickets2.Vars.agents = new Tickets2.Collections.Users(response.agents)
    return response.tickets
