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

  $('.new-answer-comment').on("click", function( event ) {
    event.preventDefault();
    var destination = $(this).attr('href');
    var ajaxRequest = $.ajax({
      method: 'GET',
      url: destination
    });
    ajaxRequest.done(function(thing) {
      $(".new-answer-comment").hide();
      $("#space-for-comment-box").append( thing );
    });
  });

  $('a#question_comment_btn').on("click", function(event){
    event.preventDefault();
    var destination = $(this).attr('href');
    var ajaxRequest = $.ajax({
      method: "GET",
      url: destination
    });
    ajaxRequest.done( function ( form ) {
      $("#question-comment-ul").prepend(form);
      $('a#question_comment_btn').css('display', 'none');
    });
  });

  $('ul#question-comment-ul').on('click', 'form input', function (event) {
    event.preventDefault();
    var destination = $('form').attr('action');
    var ajaxRequest = $.ajax({
      method: "POST",
      url: destination,
      data: $('form').serialize()
    });
    ajaxRequest.done( function (  commentBody ) {
      $('#question-comment-ul').append( commentBody );
      $('form').remove();
      $('a#question_comment_btn').css('display', 'block');
    });
  });
});
