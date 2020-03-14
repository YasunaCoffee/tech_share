FactoryBot.define do
  factory :article do
    title              {"rubyの勉強"}
    content              {"hello"}
    user
    
    # articleをnewした時に
    after(:build) do |article|
      # tagを1つ作って
      tag = create(:tag)
      # 今作ったarticleに紐付ける
      article.tags << tag
    end
  end
end
