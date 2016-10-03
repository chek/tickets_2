class Tickets2.Views.ReportTicketListItem extends Backbone.View

  template: _.template("<span class='status'><%- Tickets2.Models.Ticket.statusLabel(status) %></span>
                            <span class='subject'><%- subject %></span>
                            <span class='description'><%- description %></span>
                            <span class='email'><%- customer.get('email') %></span>")

  tagName:  'li'

  events: {
    'click button.set-in-process': 'update',
  }

  update: (e) ->
    e.preventDefault()
    nextStatus = Tickets2.Models.Ticket.inProcessStatus
    if this.model.get('status') == Tickets2.Models.Ticket.inProcessStatus
      nextStatus = Tickets2.Models.Ticket.closedStatus
    this.model.update(nextStatus)
    $('.process-ticket.modal-form', this.$el).modal('hide')
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
    return

  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    return this
