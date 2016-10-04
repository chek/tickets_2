class Tickets2.Views.SupportTicketListItem extends Tickets2.Views.Base

  template: _.template("<span class='status'><%- Tickets2.Models.Ticket.statusLabel(status) %></span>
                            <span class='subject'><%- subject %></span>
                            <span class='description'><%- description %></span>
                            <%
                            // open btn
                            %>
                            <button type='button' class='btn btn-primary btn-sm' data-toggle='modal' data-target='.<%- id %>_edit'>open</button>
                            <%
                            // open dlg
                            %>
                            <div class='modal fade process-ticket modal-form <%- id %>_edit' tabindex='-1' role='dialog' aria-labelledby='modal-label' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='modal-label'>Edit ticket</h4>
                                  </div>
                                  <div class='modal-body'>
                                    <form data-toggle='validator' role='form'>
                                      <div class='form-group'>
                                        <label>Customer email:</label>
                                        <label><%- customer.get('email') %></label>
                                      </div>
                                      <div class='form-group'>
                                        <label><%- subject %></label>
                                      </div>
                                      <div class='form-group'>
                                        <p><%- description %></p>
                                      </div>
                                      <div class='form-group'>
                                        <button class='btn set-in-process btn-primary' >
                                          <%- status == Tickets2.Models.Ticket.newStatus ? 'Set ticket in process' : '' %>
                                          <%- status == Tickets2.Models.Ticket.inProcessStatus ? 'Close ticket' : '' %>
                                        </button>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>")

  tagName:  'li'

  events: {
    'click button.set-in-process': 'update',
  }

  update: (e) ->
    e.preventDefault()
    nextStatus = Tickets2.Models.Ticket.inProcessStatus
    if this.model.get('status') == Tickets2.Models.Ticket.inProcessStatus
      nextStatus = Tickets2.Models.Ticket.closedStatus
    this.model.update(nextStatus)
    Tickets2.Views.Base.closeModal()
    return

  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    return this
