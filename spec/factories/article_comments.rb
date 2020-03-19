FactoryBot.define do
  factory :article_comment do
    content              {"hello"}
    article
    user
  end
end
