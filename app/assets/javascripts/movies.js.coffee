# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('a').tooltip()

  $(".ucollicon").on "click",(e) ->
    e.preventDefault()
    $.ajax({
      type: "POST",
      url: "/movies/" + e.currentTarget.id + "/addtouserscollection",
      #data: { },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    })