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
    this.on('remove', this.render);
    #this.listenTo(Tickets2.Vars.tickets, 'remove', this.render);

  render: ->
    Tickets2.Vars.tickets.fetch({reset: true})
    this.$el.html(this.template())
    $('#content').html(this.$el)
    this.$list = $('ul', this.$el).first()
    return this

  addOne: (ticket) ->
    view = new Tickets2.Views.TicketListItem({ model: ticket });
    this.$list.append(view.render().el);

  addAll: ->
    if Tickets2.Vars.tickets?
      Tickets2.Vars.tickets.each(this.addOne, this);