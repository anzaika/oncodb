# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
#
# @checkAll = (frm, checkedOn) ->
#
#   # have we been passed an ID
#   frm = document.getElementById(frm)  if typeof frm is "string"
#
#   # Get all of the inputs that are in this form
#   inputs = frm.getElementsByTagName("input")
#
#   # for each input in the form, check if it is a checkbox
#   i = 0
#
#   while i < inputs.length
#     inputs[i].checked = checkedOn  if inputs[i].type is "checkbox"
#     i++
#   return

$('input#query').on 'keyup', _.debounce(((e) ->
  $('form').submit()
), 400)
