$(document).on('turbolinks:load', function() {
  $('.nav-item').each(function(i,ele){
    console.log(ele)
    ele.classList.remove('active')
  })
  if (location.pathname === '/begginer'){
    $('.js-breadcrumb-begginer').addClass('active')
  }
  if (location.pathname === '/'){
    $('.js-breadcrumb-home').addClass('active')
  }
  if (location.pathname === '/articles'){
    $('.js-breadcrumb-knowledge-read').addClass('active')
  }
  if (location.pathname === '/articles/new'){
    $('.js-breadcrumb-knowledge-post').addClass('active')
  }
  if (location.pathname === '/questions'){
    $('.js-breadcrumb-question-read').addClass('active')
  }
  if (location.pathname === '/questions/new'){
    $('.js-breadcrumb-question-post').addClass('active')
  }
  if (location.pathname === '/tags/new'){
    $('.js-breadcrumb-tag').addClass('active')
  }
  if (location.pathname === '/users'){
    $('.js-breadcrumb-users').addClass('active')
  }
})