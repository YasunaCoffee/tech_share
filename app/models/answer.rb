class Answer < ApplicationRecord
has_many :questions
#belongs_to :user
has_many :comments
end
