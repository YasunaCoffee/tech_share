class Answer < ApplicationRecord
has_many :questions
has_many :answer_comments
end
