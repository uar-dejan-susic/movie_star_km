# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('a').tooltip()

  $(".ucollicon").on "click",(e) ->
    e.preventDefault()
    e.stopPropagation()
    $.ajax({
      type: "POST",
      dataType: "json"
      contentType:"application/json; charset=utf-8"
      url: "/movies/" + e.currentTarget.id + "/addtouserscollection.json"
      data: { },
      success:(data) ->
        alert('success')
        window.location.href = '/movies'
        return false
      error:(data) ->
        alert('error')
        window.location.href = '/movies'
        return false
    })