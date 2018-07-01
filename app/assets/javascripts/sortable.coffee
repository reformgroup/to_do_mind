$(document).on 'turbolinks:load', ->
  $('.sortable').sortable 
    # start: (e, ui) ->
    #   item = ui.item.index()
    #   return
    update: (e, ui) ->
      $.ajax
        url: $(this).data('url')
        type: 'PATCH'
        data: { object_id: ui.item.data('object-id'), position: ui.item.index() + 1}
      return
      
      # $.ajax
      #   url: $(this).data('url')
      #   type: 'PATCH'
      #   data: $(this).sortable('serialize')
      # return
