class Tickets2.Views.TicketsReport extends Tickets2.Views.Base

  @render: ->
    ticketsReportView = new Tickets2.Views.TicketsReport({})
    ticketsReportView.render()

  template: _.template("<h1>Tickets report</h1>" +
                       "<ul class='tickets list-unstyled'></ul>")

  tagName:  'div'

  initialize: ->
    Tickets2.Vars.tickets = new Tickets2.Collections.ReportTickets()
    this.listenTo(Tickets2.Vars.tickets, 'add', this.addOne);
    this.listenTo(Tickets2.Vars.tickets, 'reset', this.addAll);

  render: ->
    this.$el.html(this.template())
    $('#content').html(this.$el)
    this.$list = $('ul', this.$el).first()
    Tickets2.Vars.tickets.fetch({reset: true})
    return this

  addOne: (ticket) ->
    #fetch customers and agents together with tickets, search 1475435340
    customer = Tickets2.Vars.customers.find((model) ->return model.get('id') == ticket.get('customer_id'))
    ticket.set('customer', customer)
    view = new Tickets2.Views.ReportTicketListItem({ model: ticket });
    this.$list.append(view.render().el);

  addAll: ->
    header = "<li><h5 class='status'>Status</h5>
        <h5 class='subject'>Subject</h5>
        <h5 class='description'>Description</h5>\
        <h5 class='email'>Email</h5></li>"
    this.$list.append(header);
    if Tickets2.Vars.tickets?
      Tickets2.Vars.tickets.each(this.addOne, this);