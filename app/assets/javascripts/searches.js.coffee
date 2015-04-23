$('input#query').on 'keyup', _.debounce(((e) ->
  $('form').submit()
), 500)
