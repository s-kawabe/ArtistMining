// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

//artist-show
//like button click
$('.LikesIcon').on('click',function() {
  let $btn = $(this);
  
  if ($btn.hasClass('on')) {
    $btn.removeClass('on');
    $btn.children('svg').attr('class', 'far fa-heart LikesIcon-fa-heart');
  } else {
    $btn.addClass('on');
    $btn.children('svg').attr('class', 'fas fa-heart LikesIcon-fa-heart heart');
  }
})

