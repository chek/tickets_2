class Tickets2.Views.TicketsIndex extends Backbone.View

  template: _.template("<h1>Tickets</h1>" +
                       "<ul class='tickets list-unstyled'></ul>")

  tagName:  'div'

  initialize: ->
    Tickets2.Vars.tickets = new Tickets2.Collections.Tickets()
    this.listenTo(Tickets2.Vars.tickets, 'add', this.addOne);
    this.listenTo(Tickets2.Vars.tickets, 'reset', this.addAll);
    this.listenTo(Tickets2.Vars.tickets, 'all', this.all);

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