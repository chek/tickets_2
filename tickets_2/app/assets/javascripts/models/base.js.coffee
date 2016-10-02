class Tickets2.Models.Base extends  Backbone.Model

  restMethod: (end_point, method, successHandler, errorHandler) ->
    url =  this.urlRoot + '/' + end_point

    $.ajax url,
      type: method
      async: false,
      cache: false,
      contentType: false,
      processData: false,
      error: (jqXHR, textStatus, errorThrown) ->
        if errorHandler?
          errorHandler()
      success: (data, textStatus, jqXHR) ->
        if successHandler?
          successHandler(data)
    return
