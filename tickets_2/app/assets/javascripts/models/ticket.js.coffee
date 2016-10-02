class Tickets2.Models.Ticket extends Tickets2.Models.Base
  #tickets statuses, search 1475436409
  @newStatus: 0
  @inProcessStatus: 1
  @closedStatus: 2
  @deletedStatus: 4

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

  ticketCreated: (data) ->
    ticket = new Tickets2.Models.Ticket(data.ticket);
    Tickets2.Vars.tickets.add(ticket)
    Tickets2.Views.TicketsIndex.render()
    return

  create: (subject, description, successHandler, errorHandler) ->
    this.restMethod('create?subject='+subject+'&description='+description, 'POST', this.ticketCreated, errorHandler)
    return

  refreshTickets: ->
    Tickets2.Views.TicketsIndex.render()
    return

  update: (status) ->
    this.restMethod('update_ticket?id='+this.get('id')+'&status='+status, 'PATCH', this.refreshTickets, null)
    return