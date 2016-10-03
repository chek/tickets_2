class Tickets2.Views.CreateTicket extends Backbone.View
  template: _.template("<button type='button' class='btn create-ticket-btn btn-primary' data-toggle='modal' data-target='.create-ticket-container'>Create ticket</button>
                            <div id='create-ticket-container' class='modal fade create-ticket-container' tabindex='-1' role='dialog' aria-labelledby='create-ticket-label' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='create-ticket-label'>Create ticket</h4>
                                  </div>
                                  <div class='modal-body'>
                                    <form data-toggle='validator' role='form'>
                                      <div class='form-group'>
                                        <label for='ticket-subject' class='control-label'>Subject</label>
                                        <input class='form-control' id='ticket-subject'>
                                      </div>
                                      <div class='form-group'>
                                        <label for='ticket-description' class='control-label'>Description</label>
                                        <textarea class='form-control' id='ticket-description' rows='3'></textarea>
                                      </div>
                                      <div class='form-group'>
                                        <button class='btn create-ticket-submit btn-primary' >Submit</button>
                                      </div>
                                      <div class='control-group error'>
                                        <span class='help-inline'></span>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>")
  events: {
    'click button.create-ticket-submit': 'createTicket'
  }

  createTicket: (e) ->
    e.preventDefault()
    $('#create-ticket-container .help-inline').text('')
    $('#create-ticket-container .help-inline').hide()
    valid = true
    subject = encodeURIComponent($('#ticket-subject').val().trim())
    if subject.length == 0
      valid = false
      $('#create-ticket-container .help-inline').text('Subject is emty')
    description = encodeURIComponent($('#ticket-description').val().trim())
    if description.length == 0 && valid
      valid = false
      $('#create-ticket-container .help-inline').text('Description is emty')
    if valid
      $('#ticket-subject').val('')
      $('#ticket-description').val('')
      ticket = new Tickets2.Models.Ticket()
      ticket.create(subject, description)
      $('#create-ticket-container').modal('hide')
      $('body').removeClass('modal-open');
      $('.modal-backdrop').remove();
    else
      $('#create-ticket-container .help-inline').show()
    return

  render: ->
    this.$el.html(this.template())
    $('#header').append(this.$el)
    return this
