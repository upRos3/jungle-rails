class User < ActiveRecord::Base
   has_secure_password
   has_many :ratings

   def downcase_email
     self.email.downcase!
   end

   def titlecase_names
     self.first_name = self.first_name.titlecase
     self.surname = self.surname.titlecase
   end

   def self.authenticate_with_credentials(email, password)
      email = email.strip.downcase
      user = User.find_by(email: email)
      if user && user.authenticate(password)
        return user
      end
   end

   validates :email, presence: true, uniqueness: true, on: :create
   validates :first_name, presence: true
   validates :surname, presence: true
   validates :password, presence: true, length: { minimum:6 }
   validates :password, confirmation: { case_sensitive: true }
   before_save :downcase_email
   before_save :titlecase_names
end
