$(function () {
  $(".favorite").on("click", function(e){

    // 現在のパスを取得
    var url = document.location.pathname

    // お気に入りステータスが0だったらcreateアクションに、1だったらdestroyアクションにとばす
    var favoriteStatus = $(".favorite").data("favorite-status")
    var methodType = ( favoriteStatus == 0 ? "POST" : "DELETE")

    // console.log(url)
    // console.log(favoriteStatus)
    // console.log(methodType)

    $.ajax({
      type: methodType,
      url: `${url}/favorites`,
      dataType: 'json',
    })
    .done(function(favorite){
      if favoriteStatus == 0{
        // お気に入り済みだったら赤くする
        $(".favorite").css('color', 'Red');
      }
      else{
        // お気に入り済みだったら灰色にする
        // お気に入りステータスを0にする
        $(".favorite").css('color', 'Gray');
        $(".favorite").data("favorite-status", "0")

      }
    })
    .fail(function(){
      alert("お気に入り変更に失敗しました")
  })

  });
})