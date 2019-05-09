# TODO: Fix bug with prev next buttons
# TODO: Add special class
#
$(document).on 'click', 'a[data-remote="true"]', ->
  history.pushState null, '', $(this).attr('href')