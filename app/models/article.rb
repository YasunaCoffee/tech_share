class Article < ApplicationRecord
  scope :search, -> (word) { where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"])}
  has_many :article_comments, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true
end
