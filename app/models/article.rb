class Article < ApplicationRecord
  has_many :article_comments, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true

  # class method
  class << self
    def search(word, tag_filter=nil)
      if tag_filter
        where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"]).joins(:tags).merge(Tag.id_in tag_filter)
      else
        where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"])
      end
    end
  end
end
