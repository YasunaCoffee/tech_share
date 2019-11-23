class Question < ApplicationRecord
  has_many :answers 
  belongs_to :curriculum 
  #belongs_to :user

end
