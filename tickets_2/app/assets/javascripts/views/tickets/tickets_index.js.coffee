class Tickets2.Views.TicketsIndex extends Backbone.View

  @render: ->
    ticketsIndexView = new Tickets2.Views.TicketsIndex({})
    ticketsIndexView.render()

  template: _.template("<h1>Tickets</h1>" +
                       "<ul class='tickets list-unstyled'></ul>")

  tagName:  'div'

  initialize: ->
    Tickets2.Vars.tickets = new Tickets2.Collections.Tickets()
    this.listenTo(Tickets2.Vars.tickets, 'add', this.addOne);
    this.listenTo(Tickets2.Vars.tickets, 'reset', this.addAll);

  render: ->
    Tickets2.Vars.tickets.fetch({reset: true})
    this.$el.html(this.template())
    $('#content').html(this.$el)
    this.$list = $('ul', this.$el).first()
    return this

  addOne: (ticket) ->
    #diffferent view for support agent and customer
    if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.customerRole
      agent = Tickets2.Vars.agents.find((model) ->return model.get('id') == ticket.get('agent_id'))
      ticket.set('agent', agent)
      view = new Tickets2.Views.TicketListItem({ model: ticket });
    if Tickets2.Models.User.currentUser.get('role') == Tickets2.Models.User.supportRole
      customer = Tickets2.Vars.customers.find((model) ->return model.get('id') == ticket.get('customer_id'))
      ticket.set('customer', customer)
      view = new Tickets2.Views.SupportTicketListItem({ model: ticket });
    this.$list.append(view.render().el);

  addAll: ->
    if Tickets2.Vars.tickets?
      Tickets2.Vars.tickets.each(this.addOne, this);