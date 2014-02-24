var registrationValidator = function(){
  var firstNameFilled = function(){
    return $('#first-name').val() != ""
  }

  var lastNameFilled = function(){
    return $('#last-name').val() != ""
  }

  var emailFilled = function(){
    return $('#email').val() != ""
  }

  var phoneFilled = function(){
    return $('#phone').val() != ""
  }

}

var addRegistrationHandler = function(){
  $('form#mailchimp')
    .bind("ajax:beforeSend", function(){
      var waitingMessage = "<ul class='registration-message'><li class='waiting'>" + "Submitting Registration" + "</li></ul>"
      $('div#response').html(waitingMessage);
    })
    .bind("ajax:success", function(evt, data){
      console.log(data.message)
      var successMessage = "<ul class='registration-message'><li class='success'>" + data.message + "</li></ul>"
      $('div#response').html(successMessage)
      $('input#email').val("")
    })
    .bind("ajax:error", function(evt, data){
      var errorList, errorText
      try{
        var errors = $.parseJSON(data.responseText)
      }catch(err){
        errors = {message: "There were errors with the submission."}
      }
      errorText = "Please reload the page and try again."
      errorList = "<ul class='registration-message'>"
      for ( error in errors ) {
        errorList += "<li class='error'>" + errors[error] + "</li> "
      }
      errorList += "<li class='error'>" + errorText + "</li> "
      errorList += "</ul>"
      $('div#response').html(errorList)
    })
}

$(document).ready(function(){
  addRegistrationHandler()
})