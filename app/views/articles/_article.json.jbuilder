json.extract! article, :title, :id
json.user_name article.user.nickname

json.tags do
  json.array! article.tags do |tag|
    json.extract! tag, :name
  end
end