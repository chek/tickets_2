class Tickets2.Models.Ticket extends Tickets2.Models.Base

  @newStatus: 0
  @inProcessStatus: 1
  @closedStatus: 2

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

  create: (subject, description, successHandler, errorHandler) ->
    this.restMethod('create?subject='+subject+'&description='+description, 'POST', successHandler, errorHandler);
    return

