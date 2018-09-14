class User < ApplicationRecord
  validates :username, :password_digest, presence: true
  validates :session_token, presence: true 
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}
  
  after_initialize :ensure_session_token
  
  attr_reader :password
  
  def self.find_by_credentials(username, password)
      user = User.find_by(username: 'me@email.com')
      if user && user.is_password?(password)
        return user 
      else 
        return nil 
      end 
  end 
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end 
  
  def reset_session_token! 
    self.session_token = User.generate_session_token 
    self.save 
    self.session_token
  end 
  
  def password=(pw)
    @password = pw 
    self.password_digest = BCrypt::Password.create(pw)
  end 
  
  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end 
end