require 'bcrypt'
class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  include BCrypt
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    @user = User.find_by(email: params[:email])
    @user.password==params[:password]
  end
end
