$(function () {

$("#article_image").on('change', function(e) {

  // file_filedのバリューを取得（そもそもここが違う？ActiveStrageだとどういった形でinputに入るのか？）
  image = $(this).val();
  console.log(image)

  $.ajax({
    url: "/articles",
    type: "POST",
    data: {image: image},
    dataType: 'json',
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      // CSRFのエラーがでたのでトークン組み込み
    }
  })
  .done(function(image){

  })
  .fail(function(){
      alert('メッセージを入力してください')
  })

    // const file = e.target.files[0];
  //   // ファイル選択画面で選択された情報を取得
  // const blobUrl = window.URL.createObjectURL(file);
  //   // ブラウザ上からfileデータを取得

  // console.log(blobUrl);

  // formData = new FormData(document.querySelector("form"))

  // console.log(formData)

});
});