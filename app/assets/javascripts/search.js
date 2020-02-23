$(function() {
  
  $('.js-search').on('click', function(e) {
    e.preventDefault();
    const keyword = $('#search').val()
    const search_type = $('#search_type').val()
    console.log('hello')
    
    $.ajax({ 
      url: '/search',
      type: 'GET',
      data: {
        search: keyword,
        search_type: search_type,
      },
      dataType: 'json' 
    })
      
    .done(function (results) {
      console.log(results)
    })
  })

});