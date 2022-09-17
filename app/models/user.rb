class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
   
        validates :name, presence: true
        validates :surname, presence: true
        validates :email, presence: true
        validates :encrypted_password, presence: true
      
       
        def self.from_omniauth(access_token)
          puts access_token.info
          where(email: access_token.info.email).first_or_create do |user|
            user.email= access_token.info.email
            user.name = access_token.info.first_name
            user.surname=access_token.info.last_name
            user.password =  Devise.friendly_token[0,20]
            user.full_name = access_token.info.name
            user.avatar_url = access_token.info.image
           #user.name = access_token.info.name
          end
          # Uncomment the section below if you want users to be created if they don't exist
       
      end
end 
