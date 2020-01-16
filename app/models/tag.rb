class Tag < ApplicationRecord
  has_many: article, through: :artifle_tags
  has_many: article_tags
  has_many: questions, through: :question_tags
  has_many: question_tags
end
