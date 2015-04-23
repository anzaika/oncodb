$('input#query').on 'keyup', _.debounce(((e) ->
  if ($('#query').val().length > 2) {
    $('form').submit();;
  }
), 500)
