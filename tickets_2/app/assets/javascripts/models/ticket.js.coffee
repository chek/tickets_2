class Tickets2.Models.Ticket extends Tickets2.Models.Base

  @newStatus: 0
  @inProcessStatus: 1
  @closedStatus: 2
  @confirmedStatus: 3
  @deletedStatus: 4
  #tickets statuses, search 1475436409

  @ticketToDelete: null

  @statusLabel: (status) ->
    if status == Tickets2.Models.Ticket.newStatus
      return 'new'
    if status == Tickets2.Models.Ticket.inProcessStatus
      return 'in process'
    if status == Tickets2.Models.Ticket.confirmedStatus
      return 'confirmed'
    if status == Tickets2.Models.Ticket.closedStatus
      return 'closed'

  urlRoot: '/tickets'

  ticketCreated: (data) ->
    ticket = new Tickets2.Models.Ticket(data.ticket);
    Tickets2.Vars.tickets.add(ticket)
    Tickets2.Models.Base.successHandler()
    return

  create: (subject, description, successHandler, errorHandler) ->
    Tickets2.Vars.successHandler = successHandler
    Tickets2.Vars.errorHandler = errorHandler
    this.restMethod('create?subject='+subject+'&description='+description, 'POST', this.ticketCreated, Tickets2.Models.Base.errorHandler)
    return

  update: (status, successHandler, errorHandler) ->
    this.restMethod('update_ticket?id='+this.get('id')+'&status='+status, 'PATCH', successHandler, errorHandler)
    return