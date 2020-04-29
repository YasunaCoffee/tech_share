$(document).on('turbolinks:load', function() {
  if ($('.js-mb_body').length === 0) { return }
  $('.js-mb_form').on('input', function(){
    const content = $(this).val()
    // api/markdown#previewを叩く
    $.ajax({
      url: '/api/markdown/preview',
      type: 'GET',
      data: {
        content: content
      },
      dataType: 'json'
    })
    .done(function(mb_content) {
      console.log(mb_content)
      $('.js-mb_body').empty()
      $('.js-mb_body').append(mb_content.content)
    })
    .fail(function(e){
      console.log(e.status)
    })
  })
})
