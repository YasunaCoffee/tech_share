$(document).on('turbolinks:load', function() {
  if ($('.js-mb_body').length === 0) { return }
  $('.js-mb_form').on('input', function(){
    const content = $(this).val()
    const token = $('input[name=authenticity_token]').val()
    // api/markdown#previewを叩く
    $.ajax({
      url: '/api/markdown/prevew',
      type: 'POST',
      data: {
        authenticity_token: token,
        content: content
      },
      dataType: 'json'
    })
    .done(function(mb_content) {
      $('.js-mb_body').empty()
      $('.js-mb_body').append(mb_content.content)
    })
    .fail(function(e){
      alert(`${e.status} ${e.statusText}`)
    })
  })
})
