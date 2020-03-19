$(document).on('turbolinks:load', function() {

  const searchFunction = function (url) {
    const keyword = $('#search').val()
    $.ajax({
      url: url,
      type: 'GET',
      data: {
        search: keyword
      },
      dataType: 'json'
    })
    .done(function (results) {
        $('.search_result').empty();
      let addHTML = ''

      if (results.articles) {
        results.articles.forEach(function (article) {
          addHTML += buildArticle(article);
        });
      }
      
      
      if (results.questions) {
        results.questions.forEach(function (question) {
          addHTML += buildQuestion(question);
        });
      }
      
        if (results.users) {
        results.users.forEach(function (user) {
          addHTML += buildUser(user);
        });
      }
      $('.search_result').append(addHTML);
    })
    .fail(function () {
      alert('検索に失敗しました')
    })
  }


  // HTML要素をコピーして貼り付ける
  const buildArticle = function (article) {
    let tags = ''
    let tag_name = ''
    article.tags.forEach(function (tag) {
      tag_name = ' ' + tag.name;
      tags += tag_name
    });

    const html =
      `<div class="alert alert-dark" role="alert">
        <div class="d-flex justify-content-between">
          <h5 class="alert-heading">
            <div class="fas fa-book" aria-hidden="true"></div>
            <a class="alert-link" href="/articles/${article.id}">${article.title}
            </a>
          </h5>
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
  const buildQuestion = function (question) {
    const html =
      `<div class="alert alert-warning">
        <h5 class="alert-heading">
          <div class="fas fa-question-circle" aria-hidden="true">
            <a class="alert-link" href="/questions/${question.id}">${question.title}
            </a>
          </div>
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


  const buildUser = function (user) {
    const html = `
      <div class="row">
        <div class="list-group col">
          <a class="list-group-item list-group-item-action" href="/users/${user.id}">${user.nickname}</a>
        </div>
      </div>
    `
    return html
  }
  
  // 検証からコピペできる
  // フロントの検索ボタンと、検索条件のボタンを削除する

  if (location.pathname.match(/articles/)) {
    $('#search').on('input', function () {
      searchFunction('/search/index')
    })
  }

  if (location.pathname.match(/users/)) {
    $('.js-search-form').attr('placeholder', 'キーワードからユーザーを探す...')
    $('#search').on('input', function () { 
      searchFunction('/search/users_index')
    })
  }

});
