var measurements = function(){
  console.log('Section:' + $('section').last().outerHeight())
  console.log('Container:' + $('section .container').last().outerHeight())
  console.log('Card:' + $('.card').outerHeight())
  console.log('Expected Margin:' + ($('section').last().outerHeight() - $('.card').last().outerHeight()))
  console.log('Computed Margin:' + $('.v-spacer').outerHeight())
}

var fitSectionsToWindow = function(){
  var sections = $('section')
  sections.each(function(){
    if ($(this).height() < ($(window).height() * 0.9)){
      $(this).height($(window).height() * 0.9)
    }
  })
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
  navigation()
}


$(document).ready(ready)
$(document).on('page:load', ready)
