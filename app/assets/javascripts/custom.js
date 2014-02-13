var fitSectionsToWindow = function(){
  if ($('section').height() < ($(window).height() * 0.9)){
    $('section').height($(window).height() * 0.9)
  }
}

var tempNavbarFix = function(){
  if(!Modernizr.mediaqueries){
    $('.navbar-toggle').remove()
    $('.navbar-header').append('<button type="button" class="btn btn-success navbar-btn navbar-right" id="register">Register</button>')
  }
}

var ready = function(){
  tempNavbarFix()
  fitSectionsToWindow()
}


$(document).ready(ready)
$(document).on('page:load', ready)
