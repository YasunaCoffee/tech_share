class Article < ApplicationRecord
  scope :search, -> (word) { where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"])}
end
