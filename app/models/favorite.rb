class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user_id, :uniqueness: {scope: [:article_id]}
  # validates :user_id, :article_id,uniqueness: true, if: :favorite_pair?
 
  # def favorite_pair?
  #   user_id && article_id
  # end
end
