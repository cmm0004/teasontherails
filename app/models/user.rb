class User < ActiveRecord::Base
    attr_accessor :remember_token
    
    before_save { self.email = self.email.downcase }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    
    validates :name, presence: true, 
                     length: {maximum: 50}
    validates :email, presence: true, 
                      length: {maximum: 250},
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }
    has_secure_password
    
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
    
  def User.new_token
      SecureRandom.urlsafe_base64
  end
  
  
  # Remembers a user in the database for use in persistent sessions.
  def set_remember_token
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def delete_remember_digest
    update_attribute(:remember_digest, nil)
  end

  
  def authenticated?(usr_remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(usr_remember_token)
  end
    
end
