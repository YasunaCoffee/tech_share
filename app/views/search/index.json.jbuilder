json.articles @articles do |article|
  json.partial!(article)
end

json.questions @questions do |question|
  json.extract! question, :title, :id
  json.created_at question.created_at.strftime("%Y-%m-%d %H:%M")
  json.user_name question.user.nickname
end
