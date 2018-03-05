class User < ActiveRecord::Base
   has_secure_password
   has_many :ratings

   validates :email, uniqueness: true, on: :create
   #validates for first name password etc
end
