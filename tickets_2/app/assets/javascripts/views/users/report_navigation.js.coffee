class Tickets2.Views.ReportNavigation extends Tickets2.Views.Base

  template: _.template("<button type='button' class='btn report btn-primary'>Tickets Report</button>")

  tagName:  'div'

  state: 'tickets'

  reportToPDFView: null

  events: {
    'click button.report': 'loadReport',
  }

  loadReport: ->
    if this.state == 'tickets'
      $('.btn.report', this.$el).text('Tickets')
      Tickets2.Views.TicketsReport.render()
      this.state = 'report'
      this.reportToPDFView = new Tickets2.Views.ReportToPDF({})
      this.reportToPDFView.render()
    else
      $('.btn.report', this.$el).text('Tickets Report')
      Tickets2.Views.TicketsIndex.render()
      this.state = 'tickets'
      if this.reportToPDFView?
        this.reportToPDFView.remove()
    return

  render: ->
    this.$el.append(this.template())
    $('#header').append(this.$el)
    return this
