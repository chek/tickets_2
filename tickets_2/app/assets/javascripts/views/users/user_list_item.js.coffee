class Tickets2.Views.UserListItem extends Tickets2.Views.Base

  template: _.template("<span class='email'><%- email %></span><span class='role'><%- role %></span>
                            <%
                            // edit btn
                            %>
                            <button type='button' class='btn btn-primary btn-sm' data-toggle='modal' data-target='.<%- id %>'>edit</button>
                            <%
                            // edit dlg
                            %>
                            <div class='modal fade modal-form <%- id %>' tabindex='-1' role='dialog' aria-labelledby='mySmallModalLabel' aria-hidden='true'>
                              <div class='modal-dialog modal-sm'>
                                <div class='modal-content'>
                                  <div class='modal-header'>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                    <h4 class='modal-title' id='mySmallModalLabel'>Edit user</h4>
                                  </div>
                                  <div class='modal-body'>
                                    <form data-toggle='validator' role='form'>
                                      <div class='form-group'>
                                        <label for='inputEmail' class='control-label'><%- email %></label>
                                      </div>
                                      <div class='form-group'>
                                        <label for='inputPassword' class='control-label'>Role</label>

                                        <select class='form-control roles-list'>
                                          <option value='admin' <%= role == Tickets2.Models.User.adminRole ? 'selected' : '' %>>admin</option>
                                          <option value='support' <%= role == Tickets2.Models.User.supportRole ? 'selected' : '' %>>support</option>
                                          <option value='customer' <%= role == Tickets2.Models.User.customerRole ? 'selected' : '' %>>customer</option>
                                        </select>


                                      </div>
                                      <div class='form-group'>
                                        <button class='btn update-role btn-primary' >Submit</button>
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
    Tickets2.Views.Base.closeModal()
    return

  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    return this
