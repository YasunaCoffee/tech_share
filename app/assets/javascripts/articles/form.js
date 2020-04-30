$(document).on('turbolinks:load', function() {
  if ($('.js-resource_info').length === 0) { return }

  $('.js-hide_btn').on('click', function(){
    $('.js-resource_info').addClass('d-none')
    $('.js-appear_btn').removeClass('d-none')
  })

  $('.js-appear_btn').on('click', function(){
    $('.js-resource_info').removeClass('d-none')
    $('.js-appear_btn').addClass('d-none')
  })
})
