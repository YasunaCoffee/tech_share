class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
  scope :search, -> (word) { where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"])}
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  validates :title, presence: true
  validates :content, presence: true
end
