class Tickets2.Views.ReportNavigation extends Backbone.View

  template: _.template("<button type='button' class='btn report btn-primary'>Tickets Report</button>")

  tagName:  'div'

  state: 'tickets'

  events: {
    'click button.report': 'loadReport',
  }

  loadReport: ->
    if this.state == 'tickets'
      $('.btn.report', this.$el).text('Tickets')
      Tickets2.Views.TicketsReport.render()
      this.state = 'report'
    else
      $('.btn.report', this.$el).text('Tickets Report')
      Tickets2.Views.TicketsIndex.render()
      this.state = 'tickets'
    return

  render: ->
    this.$el.append(this.template())
    $('#header').append(this.$el)
    return this
