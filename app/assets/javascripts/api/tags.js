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
    // articleかquestionかをpathnameから作成する
    const resourceName = location.pathname.slice(1).slice(0,-5)
    const html = `<button class="btn btn-sm btn-outline-secondary rounded-pill selected-tag js-selected_tag">
                    <i class="far fa-times-circle" aria-hidden="true"></i>
                    <span>${name}</span>
                    <input multiple="multiple" value=${id} type="hidden" name="${resourceName}[tag_ids][]" class="tag_ids">
                  </button>`
    $('.js-selected_tags').append(html)
    $('.js-tag_name_field').val("")
  }

  // タグのインクリメンタルサーチ
  $('.js-tag_name_field').on('input', function(){
    const keyword = this.value;
    let tag_ids = []
    // 入力無しなら処理終了
    if (keyword === '') {
      $('.js-tag_list').empty()
      return
    }
    // すでに選択中のタグIDをtag_idsに入れてコントローラで検索から除く
    if($('.tag_ids')) {
      $('.tag_ids').each(function(_, ele){
        tag_ids.push(ele.value)
      })
    }
    // api/tags#searchを叩く
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
      // liを大量に入れるための変数
      let tag_list_items = ''
      tags.forEach(tag => {
        tag_list_items += buildTag(tag)
      });
      $('.js-tag_list').append(tag_list_items)
    })
    .fail(function(e){

    })
  })

  // 選択中のタグへ追加
  $('.js-tag_list').on('click', '.js-add_tag_btn', function(e) {
    e.preventDefault()
    appendTag($(this).prev().text(), $(this).prev()[0].dataset.id)
    $(this).parent().remove()
  })

  // 選択中のタグから削除
  $('.js-selected_tags').on('click', '.js-selected_tag', function(e) {
    e.preventDefault()
    $(this).remove()
  })

  // タグを作成
  $('.js-create_tag').on('click', function(e) {
    e.preventDefault()
    const tagName = $('.js-tag_name_field').val()
    if (tagName === '') {
      alert('タグ名を入力して下さい')
      return
    }
    // csrfトークンをmetaタグから取得する
    const token = $('meta[name=csrf-token]').attr('content')
    // api/tags#createを叩く
    $.ajax({
      url: '/api/tags',
      type: 'POST',
      data: {
        name: tagName,
        authenticity_token: token // ここでcsrfトークンを送る
      },
      dataType: 'json'
    })
    .done(function(tag) {
      appendTag(tag.name, tag.id)
    })
    .fail(function(e) {

    })
  })
})
