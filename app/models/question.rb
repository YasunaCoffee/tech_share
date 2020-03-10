class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user

  # belongs_to :user
  # このアソシエーションがエラーの原因
  # belongs_to :curriculum

  scope :search, -> (word) { where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"])}


  enum curriculum: {
    Basiccurriculum: 0,
    Applicationcurriculum: 1,
    Finalsubject: 2
  }

  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  # enum curriculum: {
  #   Basiccurriculum: 0,
  #   Applicationcurriculum: 1,
  #   Finalsubject: 2
  # }

end
