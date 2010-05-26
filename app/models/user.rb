require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :invitations
  has_one :original_invitation, :class_name => "Invitation", :foreign_key => "invited_user_id"
  
  validates :login_name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  
  validate :password_must_be_present
  
  class << self
    def authenticate(login_name, password)
      if user = find_by_login_name(login_name)
        if user.hashed_password == encrypt_password(password, user.salt)
          user
        end
      end
    end
    
    def encrypt_password(password, salt)
      Digest::SHA512.hexdigest(password + "dorito" + salt)
    end
  end
  
  # 'password' is a virtual attribute
  def password=(password)
    @password = password
    
    if password.present?
      self.salt = generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end
  
  private
  
  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
