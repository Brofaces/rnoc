# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready =>
    # We don't want to have spacebar and arrow keys freaking out on us
    # when we're in the new page(box) view.
    if /.*\/(new|edit)\/?$/.test(location.href) isnt true
        # keyboard navigation controls
        $(document).keydown (event) ->
            code = if event.keyCode then event.keyCode else event.which


            switch code
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

        # colorize play/stop buttons and count down to next page change
        if /.*\/cycle/.test(location.href)
            $('#play').addClass('btn-success')
            $('#play-icon').removeClass()
            $('#stop').removeClass('btn-inverse')
            $('#stop-icon').removeClass('icon-white')

            # actually perform a countdown on the play button
            count = 59
            pad = '00'

            $('#play').attr('color', 'black')
            $('#play-icon').html(count)

            setInterval( ->
                $('#play-icon').html((pad + count).slice(-pad.length))

                if count == 0
                    location.href = $('#next').attr("href") + "/cycle"

                count--
            , 1000)
    else
        # Give focus to the appropriate title box when creating new
        # page(box)es
        if /.*\/pageboxes\/new\/?$/.test(location.href)
            $('#pagebox_title').focus()
        if /.*\/pages\/new\/?$/.test(location.href)
            $('#page_title').focus()
        if /.*\/pageboxes\/[0-9]*\/edit\/?$/.test(location.href)
            $('#pagebox_title').focus()
        if /.*\/pages\/[0-9]*\/edit\/?$/.test(location.href)
            $('#page_title').focus()
