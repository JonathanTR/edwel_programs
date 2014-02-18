var navigation = function(){
  var getElementTargets = function(selector){
    var targets = []
    $(selector).each(function(){
      targets.push($(this).offset().top)
    })
    return targets
  }

  var stopScroll = function(){
    $('body').on('mousewheel', function(e){
      e.preventDefault()
    })
  }

  var startScroll = function(){
    $('body').off('mousewheel')
  }

  var snap = function(targetTop){
    stopScroll()
    $(window).off()
    $('html, body').stop().animate({
      'scrollTop': targetTop
    }, 400, 'swing', function () {
        window.scrollY = targetTop;
        setTimeout(function(){
          setWindowWatcher();
          startScroll()
        }, 850)
    });
  }

  var goingUp = function(last, current){
    return last > current
  }

  var checker = function(targets, lastPos){
    var windowTop = window.pageYOffset
    if(goingUp(lastPos, windowTop)){
      return
    }
    for( var i = 1; i < targets.length; i++ ){
      var targetTop = targets[i]
      var margin = targetTop - windowTop
      if(margin < 700 && margin > 250){
        snap(targetTop - 70)
      }
    }
  }

  var setWindowWatcher = function() {
    var targets = getElementTargets('section')
    var lastPos = window.pageYOffset
    $(window).on('scroll', function(){
      checker(targets, lastPos)
      lastPos = window.pageYOffset
    })
  }
  setWindowWatcher()
}