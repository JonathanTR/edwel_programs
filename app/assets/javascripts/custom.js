$(document).ready(function(){
  if(!Modernizr.flexboxlegacy){
    $('.navbar-toggle').remove()
    $('.navbar-header').append('<button type="button" class="btn btn-success navbar-btn navbar-right" id="register">Register</button>')
  }
})