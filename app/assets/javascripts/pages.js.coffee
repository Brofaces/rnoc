# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready =>
    $(document).keypress (event) ->
        switch event.keyCode
            # change to the previous page when the left arrow key is pressed
            when 37
                location.href = $("#prev").attr("href")
            # toggle cycling through pages when the spacebar is pressed
            when 32
                if /.*\/cycle/.test(location.href)
                    location.href = $("#stop").attr("href")
                else
                    location.href = $("#play").attr("href")
            # change to the next page when the right arrow key is pressed
            when 39
                location.href = $("#next").attr("href")
