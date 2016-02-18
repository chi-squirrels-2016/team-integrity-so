$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#new-answer').on("click", function( event ) {
    event.preventDefault();
    var destination = $(this).attr('href');
    var ajaxRequest = $.ajax({
      method: 'GET',
      url: destination
    });
    ajaxRequest.done(function(thing) {
      $("#new-answer").hide();
      $("#answers-list").append( thing );
    });
  });
  $('#answers-list').on("click", '#submit-button', function( event ) {
    event.preventDefault();
    var destination = $(this).parent().attr('action');
    var textInput = ($('#answer-form-container').children().serialize());
    var ajaxRequest = $.ajax({
      method: 'POST',
      url: destination,
      data: textInput
    });
    ajaxRequest.done(function(newAnswer) {
      $("#answers-list").append( newAnswer );
      $('#answer-form-container').remove();
      $('#new-answer').show();
    });
  });
});
