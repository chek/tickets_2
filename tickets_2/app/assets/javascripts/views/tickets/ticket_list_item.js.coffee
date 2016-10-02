class Tickets2.Views.TicketListItem extends Backbone.View

  template: _.template("<span class='status'><%- Tickets2.Models.Ticket.statusLabel(status) %></span><span class='subject'><%- subject %></span><span class='description'><%- description %></span><button type='button' class='btn btn-primary btn-sm' data-toggle='modal' data-target='.<%- id %>'>open</button>
                               <div class='modal fade modal-form <%- id %>' tabindex='-1' role='dialog' aria-labelledby='modal-label' aria-hidden='true'>
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
                                        <label for='inputEmail' class='control-label'><%- subject %></label>
                                      </div>
                                      <div class='form-group'>
                                        <p><%- description %></p>
                                      </div>
                                      <div class='form-group'>
                                        <% if (status == Tickets2.Models.Ticket.closedStatus) { %>
                                        <button class='btn update-role btn-primary' >Submit</button>
                                        <% } %>
                                      </div>
                                    </form>
                                  </div>
                                </div>
                              </div>
                            </div>")

  tagName:  'li'

  events: {
    'click button.update-role': 'updateRole',
  }

  updateRole: (e) ->
    e.preventDefault()
    this.model.set('role', $('.roles-list', this.$el).val())
    this.model.updateRole()
    $('span.role', this.$el).text($('.roles-list', this.$el).val())
    $('.modal-form', this.$el).modal('hide')
    $('#sign-up-container').modal('hide')
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
    return

  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    return this
