class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  has_many :answer_comments
  has_many :articles
  has_many :article_comments
  has_many :questions
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article
end
