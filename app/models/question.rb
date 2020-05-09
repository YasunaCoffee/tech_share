class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  validates :title, presence: true
  validates :content, presence: true

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
