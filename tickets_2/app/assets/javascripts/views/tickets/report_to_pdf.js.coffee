class Tickets2.Views.ReportToPDF extends Backbone.View

  template: _.template("<button type='button' class='btn pdf btn-primary'>To PDF</button>")

  tagName:  'div'

  state: 'tickets'

  events: {
    'click button.pdf': 'loadPDF',
  }

  @formatDate: (date) ->
    formated_date = date.getMonth()+1 + "/" + date.getDate() + "/" + date.getFullYear()
    return formated_date

  loadPDF: ->
    doc = new jsPDF()
    doc.setFontSize(22)
    today = new Date()
    priorDate = new Date().setDate(today.getDate()-30)
    ms_in_day = 24*3600*1000
    priorDate = new Date(today - 30 * ms_in_day)
    formatedToday = Tickets2.Views.ReportToPDF.formatDate(today)
    formatedPriorDate = Tickets2.Views.ReportToPDF.formatDate(priorDate)
    doc.text(20, 20, 'Closed tickets report   (' + formatedPriorDate + ' - ' + formatedToday + ')')
    doc.setFontSize(16)
    i = 0
    Tickets2.Vars.tickets.each( (ticket) ->
      i = i + 1
      date_str = ticket.get('updated_at')
      date = new Date(date_str)
      formated_date = Tickets2.Views.ReportToPDF.formatDate(date)
      doc.text(20, 20 + (i * 10),
        formated_date + "     " +
        ticket.get('customer').get('email') + "     " +
        ticket.get('subject')
      )
    )
    doc.save('Tickets_report.pdf')
    return

  render: ->
    this.$el.addClass('pdf')
    this.$el.append(this.template())
    $('#header').append(this.$el)
    return this
