class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :responses, as: :responsable
  has_many :votes, as: :votable

  validates :body, presence: true
end
