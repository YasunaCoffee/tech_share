class Answer < ApplicationRecord
has_many :questions
has_many :answer_comments
belongs_to :user
validates :content, presence: true
end
