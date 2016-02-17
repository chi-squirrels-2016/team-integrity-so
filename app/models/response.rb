class Response < ActiveRecord::Base
  belongs_to :responsable, polymorphic: true
end
