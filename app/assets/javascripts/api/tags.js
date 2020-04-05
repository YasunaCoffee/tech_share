$(document).on('turbolinks:load', function() {

  // インクリメンタルサーチで追加されるhtml
  const buildTag = (tag)=>{
    const html = `<li class="list-group-item d-flex justify-content-between">
                    <div class="tag_name" data-id=${tag.id}>${tag.name}</div>
                    <button class="add_tag_btn btn-sm rounded-pill btn-success js-add_tag_btn">add</button>
                  </li>`
    return html
  }

  // タグ名とidを受け取り、タグ一覧へ追加する関数
  const appendTag = (name, id)=>{
    const html = `<button class="btn btn-sm btn-outline-secondary rounded-pill selected-tag js-selected_tag">
                    <i class="far fa-times-circle" aria-hidden="true"></i>
                    <span>${name}</span>
                    <input multiple="multiple" value=${id} type="hidden" name="article[tag_ids][]" class="tag_ids">
                  </button>`
    $('.js-selected_tags').append(html)
  }

  // タグのインクリメンタルサーチ
  $('.js-tag_name_field').on('input', function(){
    const keyword = this.value;
    if (keyword === '') {
      $('.js-tag_list').empty()
      return
    }
    let tag_ids = []
    if($('.tag_ids')) {
      $('.tag_ids').each(function(_, ele){
        tag_ids.push(ele.value)
      })
    }
    $.ajax({
      url: '/api/tags/search',
      type: 'GET',
      data: {
        keyword: keyword,
        tag_ids: tag_ids
      },
      dataType: 'json'
    })
    .done(function(tags) {
      $('.js-tag_list').empty()
      let tag_list_items = ''
      tags.forEach(tag => {
        tag_list_items += buildTag(tag)
      });
      $('.js-tag_list').append(tag_list_items)
    })
  })

  // 追加ボタン
  $('.js-tag_list').on('click', '.js-add_tag_btn', function(e) {
    e.preventDefault()
    appendTag($(this).prev().text(), $(this).prev()[0].dataset.id)
    $(this).parent().remove()
  })

  // 削除ボタン
  $('.js-selected_tags').on('click', '.js-selected_tag', function(e) {
    e.preventDefault()
    $(this).remove()
  })

  // タグ作成ボタン
  $('.js-create_tag').on('click', function(e) {
    e.preventDefault()
    const tagName = $('.js-tag_name_field').val()
    $.ajax({
      url: '/api/tags',
      type: 'POST',
      data: {
        tag_name: tagName
      },
      dataType: 'json'
    })
    .done(function(tags) {
    })
  })
})
