// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

var ready = function() {
    $('.endorsements-link').on('click', function(event) {
        event.preventDefault();
        var endorsementCount = $(this).siblings('.endorsements_count');
        $.post(this.href, function(response) {
            endorsementCount.text(response.new_endorsement_count);
        });
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);