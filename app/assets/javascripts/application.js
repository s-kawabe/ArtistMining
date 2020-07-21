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
