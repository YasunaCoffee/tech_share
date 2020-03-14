class Article < ApplicationRecord
  scope :search, -> (word) { where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"])}
  has_many :article_comments
  has_many :article_tags
  has_many :tags, through: :article_tags
  belongs_to :user
  has_many :favorites
  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true
end
