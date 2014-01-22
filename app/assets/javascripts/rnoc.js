$(document).ready(function(){
    // Give some useful information about the buttons, and make sure
    // the tooltip is actually visible
    $("[rel=tooltip]").tooltip({placement: 'top'});

    // The help button will load a fancy modal dialog

    $('#rnoc-help').click(function() {
        $('#myModal').modal('show');
    });
});
