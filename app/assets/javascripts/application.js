// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).ready(function() {
    $("a[rel=popover]")
        .popover({
                    offset: 10
                })
        .click(function(e) {
                    e.preventDefault()
                })
});


//function hide_button_show_spinner(element_id) {
//  $('#'+element_id).bind('click', function() {
//    $('#'+element_id).after("<img src='assets/ajax-loader.gif' class='ajax_loader' id='"+element_id+"_ajax_loader' style='display: none'/>")
//    $('#'+element_id).hide();
//    $('#'+element_id+'_ajax_loader').show();
//  });
//}
//
