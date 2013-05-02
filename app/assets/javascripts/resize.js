$(document).ready(function(){
    // Oh browsers, you have such funny behavior some times....
    //
    // So, here's the deal: We need to calculate a value that
    // represents the available vertical space in the middle of the
    // viewable page. There are obstacles in our way which accounting
    // for is trivial: The height of the footer, the height of the
    // pagebox titlebox, even the approximate amount of space we
    // expect to have between the top/bottom navbar and the
    // titlebar/pagebox. What's challenging is calculating the size of
    // the logo image.
    //
    // Sure! We COULD just tell people to fuck off, and that their
    // images must meet certain width/height constraints because we
    // hard-coded some values into our calculations...
    //
    // The effective width/height of image elements in the DOM are
    // initialized to 0, once they completely load the DOM updates
    // with the actual values. Before the page resources finish
    // loading, the javascript has most likely already finished
    // loading and running. Succinctly stated: the javascript finishes
    // first, so the value it receives back when calling the .height()
    // method is '0'.
    //
    // To hack around this we create a new in-memory image object and
    // bind some code to it's .load() event which updates a global
    // variable which stores the actual height of the image.
    //
    // Unfortunately when creating an image in this way we are not
    // given any promise methods. So the only time we know that the
    // image has finished loading and we have determined it's true
    // height is in the .load() method itself.
    //
    // Because of all of these reasons, we are forced to put the call
    // to the resize_pagebox_full() function inside of the
    // logo_height() function.
    //
    // And I am ashamed.
    //
    // On a side note, at least we only need to call the resize
    // function once in this way. The resize event for the window is
    // actually bound to the proper resize_pagebox_full() function.
    function logo_height() {
        // shamelessly stolen from http://stackoverflow.com/a/670433
        var img = $('#rnoc-logo')[0];
        $("<img/>")
            .attr("src", $(img).attr("src"))
            .load(function() {
                logo_height = this.height;
                resize_pagebox_full();
            });
    }

    // How much buffer room we want to leave between the head/foot'ers
    // and the actual full dimension pagebox
    padding_xy = {
        // The pagebox titlebar height is ~22px, plus space for the
        // gap between the header/footer and the pagebox (35/28), plus
        // misc. border space
        'y': 82,
        // Experimentally derived value from rigorous browser resizing
        'x': 15,
    };

    // Use the logo as our measure of height for the header because
    // the actual navbar div element has much smaller calculated
    // dimensions than actual dimensions (due to the logo)
    logo_xy = {
        'y': 0,
    };
    // Call function to grab real value
    logo_height();

    // Use the straight up footer dimensions
    footer_xy = {
        'y': $('.navbar-fixed-bottom').height(),
    };

    // We will calculate these and fill 'em in later
    pagebox_full_xy = {
        'y': 0,
        'x': 0,
    };

    // RAW page dimensions. We'll subtract the logo/footer/padding
    // values from these to come up with our final dimensions later
    page_xy = {
        'y': $(window).height(),
        'x': $(window).width(),
    };

    function resize_pagebox_full() {
        // recalculate when the page is resized
        page_xy = {
            'y': $(window).height(),
            'x': $(window).width(),
        };
        pagebox_full_xy.x = page_xy.x - padding_xy.x;
        pagebox_full_xy.y = page_xy.y - footer_xy.y - logo_height - padding_xy.y;
        // Use the debugging, Luke!
        //
        // console.log("[Subtractors] footer: " + footer_xy.y + ", logo: " +  logo_height + ", padding: " + padding_xy.y);
        // console.log("[Width] Page/Pagebox: " + page_xy.x + "/" + pagebox_full_xy.x);
        // console.log("[Height] Page/Pagebox: " + page_xy.y + "/" + pagebox_full_xy.y);
        $('iframe').height(pagebox_full_xy.y).width(pagebox_full_xy.x);
    }

    // Event handler for page resize events
    $(window).resize(function() {
        resize_pagebox_full();
    });
});
