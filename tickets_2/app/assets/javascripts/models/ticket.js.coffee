class Tickets2.Models.Ticket extends Tickets2.Models.Base

  @newStatus: 0
  @inProcessStatus: 1
  @closedStatus: 2

  urlRoot: '/tickets'

  create: (subject, description, successHandler, errorHandler) ->
    this.restMethod('create?subject='+subject+'&description='+description, 'POST', successHandler, errorHandler);
    return

