FactoryBot.define do
  factory :tag do
    name              {Faker::ProgrammingLanguage.unique.name}
  end
end