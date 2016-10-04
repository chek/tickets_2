class Tickets2.Views.TicketsNavigation extends Tickets2.Views.Base

  template: _.template("<button type='button' class='btn tickets btn-primary'>Tickets</button>")

  tagName:  'div'

  state: 'users'

  reportToPDFView: null

  events: {
    'click button.tickets': 'loadTicket',
  }

  loadTicket: ->
    if this.state == 'users'
      $('.btn.tickets', this.$el).text('Users')
      Tickets2.Views.TicketsIndex.render()
      this.state = 'tickets'
    else
      $('.btn.tickets', this.$el).text('Tickets')
      usersView = new Tickets2.Views.UsersIndex({})
      usersView.render()
      this.state = 'users'
    return

  render: ->
    this.$el.append(this.template())
    $('#header').append(this.$el)
    return this
