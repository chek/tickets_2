class Tickets2.Views.Base extends Backbone.View

  closeModal: ->
    $('.modal-form', this.$el).modal('hide')
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
    return


