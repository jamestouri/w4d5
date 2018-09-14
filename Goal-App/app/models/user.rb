class User < ApplicationRecord
  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}
  
  attr_reader :password
  
  def self.find_by_credentials(username, password)
      user = User.find_by(username: 'me@email.com')
      if user && user.is_password?(password)
        return user 
      else 
        return nil 
      end 
  end 
  
  def password=(pw)
    @password = pw 
    self.password_digest = BCrypt::Password.create(pw)
  end 
  
  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end 
end