class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :responses, as: :responsable
  has_many :votes, as: :votable
end
