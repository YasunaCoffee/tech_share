class Tag < ApplicationRecord
  has_many :articles, through: :article_tags
  has_many :article_tags
  has_many :questions, through: :question_tags
  has_many :question_tags
  validates :name, presence: true, uniqueness: true
end
