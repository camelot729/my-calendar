# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'change', "#event-id-select", () ->
  params = {
    start_time: $('select[name=event_id]').val(),
  }

  $.get '/list_ajax', params,  'json'
  return
