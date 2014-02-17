var getElementTargets = function(selector){
  var targets = []
  $(selector).each(function(){
    targets.push($(this).offset().top)
  })
  return targets
}

var windowWatcher = function() {
  var targets = getElementTargets('section')
  $(window).on('scroll', function(){
    var windowTop = window.scrollY
    for( var i = 1; i < targets.length; i++ ){
      var targetTop = targets[i]
      var margin = targetTop - windowTop
      if( margin > 0 && margin < 200 ){
        console.log('Snap!')
      }
    }
  })
}

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
  windowWatcher()
}


$(document).ready(ready)
$(document).on('page:load', ready)
