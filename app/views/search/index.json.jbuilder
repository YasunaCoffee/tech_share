json.articles @articles do |article|
  json.extract! article, :title
  json.user_name article.user.nickname
end



json.questions @questions do |question|
  json.extract! question, :title, :created_at
  json.user_name question.user.nickname
end

#以下次回修正
#@tagsが配列のなかに配列が入っている、それをjbuilderのなかで表現方法が
json.array! @tags do |tag|
  json.name tag.name
end