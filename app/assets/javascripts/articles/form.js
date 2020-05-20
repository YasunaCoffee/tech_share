$(document).on('turbolinks:load', function() {
  if ($('.js-resource_info').length === 0) { return }

  const buildImgMarkDown = blob => {
    const url = `${location.origin}/rails/active_storage/blobs/${blob.signed_id}/${blob.filename}`
    return `![${blob.filename}](${url})`
  }

  $('.js-hide_btn').on('click', function(){
    $('.js-resource_info').addClass('d-none')
    $('.js-appear_btn').removeClass('d-none')
  })

  $('.js-appear_btn').on('click', function(){
    $('.js-resource_info').removeClass('d-none')
    $('.js-appear_btn').addClass('d-none')
  })

  $('.js-image_file_field').on('change', function(e) {
    const file = e.target.files[0]
    // direct_upload: true にしてるとこのカスタムデータがある
    const url = this.dataset.directUploadUrl
    // require activestorage で追加されるアップロード用クラス
    const upload = new ActiveStorage.DirectUpload(file, url)
    upload.create((error, blob) => {
      if (error) {
        // エラーハンドリングをここに書く
      } else {
        // blobには返り値としてsigned_idが含まれており、これを利用することで画像の表示やコントローラでのattachができる
        // blobのsigned_idを送信するためのinputを作る
        const hiddenField = document.createElement('input')
        hiddenField.setAttribute("type", "hidden");

        // hiddenFieldにアップロードしたblobのsigned_idを埋め込む
        hiddenField.setAttribute("value", blob.signed_id);
        // name指定してコントローラで受け取れるようにする
        hiddenField.name = 'signed_ids[]'
        // 作ったhiddenFieldをフォーム内にappendする
        document.querySelector('.js-main_form').appendChild(hiddenField)

        // file_fieldの中身を空にする(やっておかないと送信時にblobsのレコードが増える)
        $('.js-image_file_field').val('')

        // blobをマークダウン化してフォームに入力する
        $('.js-mb_form').focus()
        document.execCommand('insertText', false, buildImgMarkDown(blob));
      }
    })
  })
})
