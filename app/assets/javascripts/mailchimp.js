var displayMessage = function(message, type){
  $('div#response').slideUp(400, function(){
    var display = "<ul class='registration-message'><li class='" + type + "'>" + message + "</li></ul>"
    $('div#response').html(display);
    $('div#response').slideDown();
  });
}

var addRegistrationValidator = function(){
  var firstNameEmpty = function(){
    return $('#first-name').val() == ""
  }

  var lastNameEmpty = function(){
    return $('#last-name').val() == ""
  }

  var emailEmpty = function(){
    return $('#email').val() == ""
  }

  var emailInvalid = function(){
    if ($('#email').val().match(/.+\@.+\..+/)){
      return false
    }else{
      return true
    }
  }

  var phoneEmpty = function(){
    return $('#phone').val() == ""
  }

  $('#registration-submit').on("click", function(e){
    e.preventDefault()
    switch(true){
      case firstNameEmpty():
        displayMessage('Please provide a first name.', 'error')
        break
      case lastNameEmpty():
        displayMessage('Please provide a last name.', 'error')
        break
      case emailEmpty():
        displayMessage('Please provide an email address.', 'error')
        break
      case emailInvalid():
        displayMessage('Please provide a <strong>valid</strong> email address.', 'error')
        break
      case phoneEmpty():
        displayMessage('Please provide a phone number.', 'error')
        break
      default: 
        $('form').submit()
        break
    }
  })
}

var addRegistrationHandler = function(){
  $('form#mailchimp')
    .bind("ajax:beforeSend", function(){
      displayMessage('...submitting registration', 'waiting')
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
  addRegistrationValidator()
  addRegistrationHandler()
})