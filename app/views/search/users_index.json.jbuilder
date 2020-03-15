json.users @users do |user|
  json.extract! user, :nickname, :id
end