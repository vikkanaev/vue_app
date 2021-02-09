class User < ApplicationRecord
  attr_accessor :user_password, :user_password_confirmation

  before_save :encrypt_password

  def encrypt_password
    self.password_hash = BCrypt::Password.create(user_password)
  end

  def password
    BCrypt::Password.new(password_hash) if password_hash.present?
  end

  def self.authenticate(email:, user_password:)
    user = User.find_by(email: email)
    return unless user
    
    user.password == user_password ? user : nil
  end
end
