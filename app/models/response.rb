class Response < ActiveRecord::Base
  belongs_to :responsable, polymorphic: true
  belongs_to :user
end
