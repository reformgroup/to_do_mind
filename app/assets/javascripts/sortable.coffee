$(document).on 'turbolinks:load', ->
  $('.sortable').sortable
    update: (e, ui) ->
      $.ajax
        url: $(this).data('url')
        type: 'PATCH'
        data: { object_id: ui.item.data('object-id'), position: ui.item.index() + 1}
      return
