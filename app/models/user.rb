class User < ActiveRecord::Base
   has_secure_password
   has_many :ratings

   validates :email, presence: true, uniqueness: true, on: :create
   validates :first_name, presence: true
   validates :surname, presence: true
   validates :password, presence: true
   validates :password_confirmation, presence: true
end
