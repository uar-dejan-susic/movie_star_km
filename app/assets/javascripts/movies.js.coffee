# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#jQuery( function($) {
#  $('a').tooltip();
#});

$ ->
  $('a').tooltip()

$ ->
  $("#atcbtn").click(e) ->
    e.preventDefault()
    alert('test')
    $.ajax({
      type: "POST",
      url: "/movies/" + $("#movieid").val() + "/addtouserscollection",
      data: { },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    })