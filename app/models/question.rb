class Question < ApplicationRecord
  has_many :answers
  # belongs_to :user
  # このアソシエーションがエラーの原因
  # belongs_to :curriculum
  enum curriculum: {
    Basiccurriculum: 0,
    Applicationcurriculum: 1,
    Finalsubject: 2
  }
end
