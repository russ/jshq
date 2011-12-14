class User < ActiveRecord::Base
  has_many :packages

  attr_accessible :email, :password, :password_confirmation, :remember_me

  before_save :ensure_authentication_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable
end
