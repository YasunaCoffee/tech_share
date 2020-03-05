$(function () {

  // HTML要素をコピーして貼り付ける
  const buildArticle = function (article) {
    let tags = ''
      article.tags.forEach(function (tag) {
        tag_name = ' ' + tag.name;
        tags += tag_name
      });

    const html = `<div class="alert alert-dark" role="alert">
    <div class="d-flex justify-content-between">
    <h5 class="alert-heading">
    <div class="fas fa-book" aria-hidden="true"></div>
    <a class="alert-link" href="/articles/${article.id}">${article.title}
    </a></h5>
    <p>
    投稿者：
    ${article.user_name}
    </p>
    </div>
    <hr>
    ${tags}
    </div>`
    return html
  }
  const buildQuestions = function (question) {
    const html = `<div class="alert alert-warning">
    <h5 class="alert-heading">
    <div class="fas fa-question-circle" aria-hidden="true">
    <a class="alert-link" href="/questions/${question.id}">${question.title}
    </a></div>
    </h5>
    <hr>
    <div class="d-flex justify-content-between">
    <div class="name">
    質問者：
    ${question.user_name}
    </div>
    <div class="date">
    投稿日時：
    ${question.created_at}
    </div>
    </div>
    
    </div>`
    return html
  }

  // 検証からコピペできる
  // フロントの検索ボタンと、検索条件のボタンを削除する
  
  $('#search').on('input', function(e) {
    e.preventDefault();
    const keyword = $('#search').val()
    const search_type = $('#search_type').val()
    
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
      $('.search_result').empty();
      let addHTML = ''

      if (results.articles.length > 0) { 
        results.articles.forEach(function (article) {
          addHTML += buildArticle(article);
        });
      }
      
      if (results.questions.length > 0) {   
        results.questions.forEach(function (question) {
          addHTML += buildQuestions(question);
        });
      } 
      $('.search_result').append(addHTML);
    })
      
    .fail(function () {
    alert('検索に失敗しました')  
    })
  })

});