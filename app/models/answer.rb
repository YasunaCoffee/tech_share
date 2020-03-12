class Answer < ApplicationRecord
  has_many :answer_comments, dependent: :destroy
  belongs_to :question
  belongs_to :user
end
