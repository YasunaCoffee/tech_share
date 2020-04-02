$(document).on('turbolinks:load', function() {
  $('.js-scrollBtn').on('click', function(e){
    e.preventDefault()
    const href = $(this).attr('href')
    const y = $(href).offset().top
    const headerHeight = 100
    $('body,html').animate({scrollTop: y - headerHeight},500)
  })
})