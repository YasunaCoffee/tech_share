class Question < ApplicationRecord
  has_many :answers
  #belongs_to :user
  enum curriculum: {
    Basiccurriculum: 0,
    Applicationcurriculum: 1,
    Finalsubject: 2
  }
end
