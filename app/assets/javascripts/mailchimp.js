var addRegistrationHandler = function(){
  $('form#mailchimp')
    .bind("ajax:beforeSend", function(){
      $('div#response').text( "Adding Email...." );
    })
    .bind("ajax:success", function(evt, data){
      console.log(data.message)
      $('div#response').html(data.message)
      $('input#email').val("")
    })
    .bind("ajax:error", function(evt, data){
      var errorList, errorText
      try{
        var errors = $.parseJSON(data.responseText)
      }.catch(err){
        errors = {message: "There were errors with the submission."}
      }
      errorText = "Please reload the page and try again."
      errorList = "<ul>"
      for ( error in errors ) {
        errorList += "<li>" + error + ': ' + errors[error] + "</li> "
      }
      errorList += "<li>" + errorText + "</li> "
      errorList += "</ul>"
      $('div#response').html(errorList)
    })
}

$(document).ready(function(){
  addRegistrationHandler()
})