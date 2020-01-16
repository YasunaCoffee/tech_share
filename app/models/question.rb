class Question < ApplicationRecord
  has_many :answers
  has_many: question_tags
  has_many: tags, through: :question_tags

  enum curriculum: {
    Basiccurriculum: 0,
    Applicationcurriculum: 1,
    Finalsubject: 2
  }
end
