class Tickets2.Views.TicketListItem extends Backbone.View

  template: _.template("<span class='status'><%- Tickets2.Models.Ticket.statusLabel(status) %></span>
                            <span class='subject'><%- subject %></span>
                            <span class='description'><%- description %></span>
                            <button type='button' class='btn btn-primary btn-sm' data-toggle='modal' data-target='.<%- id %>_edit'>open</button>
                            <button type='button' class='btn delete-btn btn-primary btn-sm <%- Tickets2.Models.Ticket.closedStatus == status ? 'disabled' : '' %>' data-toggle='modal' data-target='.<%- Tickets2.Models.Ticket.closedStatus != status ? id : '' %>_delete'>delete</button>
                            <div class='modal fade edit modal-form <%- id %>_edit' tabindex='-1' role='dialog' aria-labelledby='modal-label' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='modal-label'>Ticket</h4>
                                  </div>
                                  <div class='modal-body'>
                                    <form data-toggle='validator' role='form'>
                                      <div class='form-group'>
                                        <label>Agent email:</label>
                                        <label><%- agent.get('email') %></label>
                                      </div>
                                      <div class='form-group'>
                                        <label><%- subject %></label>
                                      </div>
                                      <div class='form-group'>
                                        <p><%- description %></p>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class='modal fade delete modal-form <%- id %>_delete' tabindex='-1' role='dialog' aria-labelledby='modal-label' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='modal-label'>Delete ticket?</h4>
                                  </div>
                                  <div class='modal-body'>
                                    <form data-toggle='validator' role='form'>
                                      <div class='form-group'>
                                        <label for='inputEmail' class='control-label'><%- subject %></label>
                                      </div>
                                      <div class='form-group'>
                                        <button class='btn confirm-delete btn-primary' >Delete</button>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>")

  tagName:  'li'

  events: {
    'click button.confirm-delete': 'deleteTicket',
    'click button.confirm-close': 'confirmTicket',
  }

  deleteTicket: (e) ->
    e.preventDefault()
    nextStatus = Tickets2.Models.Ticket.deletedStatus
    this.model.update(nextStatus)
    $('.delete.modal-form', this.$el).modal('hide')
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
    return

  confirmTicket: (e) ->
    e.preventDefault()
    nextStatus = Tickets2.Models.Ticket.confirmedStatus
    this.model.update(nextStatus)
    $('.edit.modal-form', this.$el).modal('hide')
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
    return

  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    if Tickets2.Models.Ticket.closedStatus == this.model.get('status')
      editDialog = $('.' + this.model.get('id') + '_edit', this.$el)
      form = $('form', editDialog)
      form.append("<div class='form-group'><button class='btn confirm-close btn-primary'>Confirm</button></div>")
    return this
