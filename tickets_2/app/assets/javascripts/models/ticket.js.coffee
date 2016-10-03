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
    if !Tickets2.isTestEnv()
      Tickets2.Views.TicketsIndex.render()
    return

  create: (subject, description) ->
    this.restMethod('create?subject='+subject+'&description='+description, 'POST', this.ticketCreated, null)
    return

  refreshTickets: ->
    Tickets2.Views.TicketsIndex.render()
    return

  update: (status) ->
    this.restMethod('update_ticket?id='+this.get('id')+'&status='+status, 'PATCH', this.refreshTickets, null)
    return