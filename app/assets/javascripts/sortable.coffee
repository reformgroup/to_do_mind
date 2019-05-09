$(document).on 'turbolinks:load', ->
  sortable()
  sortableTree()
  return
  
$(document).on 'ajax:success', ->
  sortable()
  sortableTree()
  return

sortable = ->
  $('.sortable').ready ->
    $('.sortable').sortable
      update: (e, ui) ->
        $.ajax
          url: $(this).data('url')
          type: 'PATCH'
          data:
            object_id: ui.item.data('object-id')
            position: ui.item.index() + 1

sortableTree = ->
  # $('.sortable-tree').nestedSortable
  #     forcePlaceholderSize: true
  #     items: 'li'
  #     handle: 'div'
  #     placeholder: 'menu-highlight'
  #     listType: 'ol'
  #     maxLevels: 2
  #     opacity: .6
  #   return
  $('.sortable-tree').each ->
    $(this).nestedSortable
      forceHelperSizeType: true
      errorClass: 'cantdoit'
      disableNesting: 'cantdoit'
      handle: '> .item'
      helper:  'clone'
      listType: 'ol'
      items: 'li'
      opacity: 0.6
      placeholder: 'placeholder'
      revert: 250
      maxLevels: $(this).data('max-levels')
      tolerance: 'pointer'
      toleranceElement: '> div'
      isTree: true
      startCollapsed: false
      
      
      
      # forcePlaceholderSize: true,
      # handle: 'div',
      # helper:  'clone',
      # items: 'li',
      # opacity: .6,
      # placeholder: 'placeholder',
      # revert: 250,
      # tabSize: 25,
      # tolerance: 'pointer',
      # toleranceElement: '> div',
      # maxLevels: 4,
      # isTree: true,
      # expandOnHover: 700,
      # startCollapsed: false,
  
      # change: ->
      #   console.log('Relocated item');
				



#
# sortableTree = ->
#   $('.sortable-tree').ready ->
#     $('.sortable-tree').nestedSortable
#       forcePlaceholderSize: true,
#       handle: 'div',
#       helper:  'clone',
#       items: 'li',
#       opacity: .6,
#       placeholder: 'placeholder',
#       revert: 250,
#       tabSize: 25,
#       tolerance: 'pointer',
#       toleranceElement: '> div',
#       maxLevels: $(this).data('max-levels'),
#       isTree: true,
#       expandOnHover: 700,
#       startCollapsed: false
#       relocate: ->
#         #$(this).nestedSortable("disable");
#         data = $(this).nestedSortable('serialize')
#         url = $(this).data('url')
#         # update on server
#         $.ajax(
#           url: url
#           type: 'POST'
#           data: data).always(->
#           #$(this).nestedSortable("enable");
#           $(this).find('.item').each (index) ->
#             if index % 2
#               $(this).removeClass('odd').addClass 'even'
#             else
#               $(this).removeClass('even').addClass 'odd'
#             return
#           return
#         ).done((data) ->
#         ).fail (jqXHR, textStatus) ->
#         return
#     return
#   return