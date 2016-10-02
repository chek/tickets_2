class Tickets2.Models.Ticket extends Tickets2.Models.Base

  @newStatus: 0
  @inProcessStatus: 1
  @closedStatus: 2

  @ticketToDelete: null

  @statusLabel: (status) ->
    if status == Tickets2.Models.Ticket.newStatus
      return 'new'
    if status == Tickets2.Models.Ticket.inProcessStatus
      return 'in process'
    if status == Tickets2.Models.Ticket.closedStatus
      return 'closed'

  @submitLabel: (status) ->
    if status == Tickets2.Models.Ticket.newStatus
      return 'Create'
    if status == Tickets2.Models.Ticket.inProcessStatus
      return 'Close'
    if status == Tickets2.Models.Ticket.closedStatus
      return 'Confirm'

  urlRoot: '/tickets'

  ticketDeleted: ->
    Tickets2.Vars.tickets.remove(Tickets2.Models.Ticket.ticketToDelete.get('id'))
    Tickets2.Views.TicketsIndex.render()
    return

  ticketCreated: (data) ->
    ticket = new Tickets2.Models.Ticket(data.ticket);
    Tickets2.Vars.tickets.add(ticket)
    Tickets2.Views.TicketsIndex.render()
    return

  create: (subject, description, successHandler, errorHandler) ->
    this.restMethod('create?subject='+subject+'&description='+description, 'POST', this.ticketCreated, errorHandler)
    return

  deleteTicket: ->
    Tickets2.Models.Ticket.ticketToDelete = this
    this.restMethod('delete_ticket?id='+Tickets2.Models.Ticket.ticketToDelete.get('id'), 'DELETE', this.ticketDeleted, null)
    return