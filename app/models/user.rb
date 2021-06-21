class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
   validates :username, :password, :email, presence: true 
   #validates :username, uniqueness: true 
end
