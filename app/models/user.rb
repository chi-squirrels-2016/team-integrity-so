class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :responses, as: :responsable
  has_many :votes, as: :votable

  validates :email, presence: true, uniqueness: true
  validate :valid_email
  validate :password_requirements

  def authenticate(password)
    self.password == password
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    # store the new_password for use later in validations
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  private

  def raw_password
    @raw_password
  end

  def password_requirements
    # validate that the raw password is at least 4 characters long
    if raw_password.length < 4
      errors.add(:password, "must be at least 4 characters long.")
    end
  end

  def valid_email
    unless self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "must be valid... please.")
    end
  end

end
