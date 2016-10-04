class Tickets2.Views.ReportTicketListItem extends Tickets2.Views.Base

  template: _.template("<span class='status'><%- Tickets2.Models.Ticket.statusLabel(status) %></span>
                            <span class='subject'><%- subject %></span>
                            <span class='description'><%- description %></span>
                            <span class='email'><%- customer.get('email') %></span>")

  tagName:  'li'

  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    return this
