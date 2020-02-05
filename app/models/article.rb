class Article < ApplicationRecord
  has_many :article_comments
  has_many :article_tags
  has_many :tags, through: :article_tags
end
